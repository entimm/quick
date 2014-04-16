package ${package+".action"}
// Generated ${date} by Hibernate Tools ${version}

<#assign classbody>
<#assign declarationName = pojo.importType(pojo.getDeclarationName())>
<#assign serviceName = pojo.shortName.toLowerCase()+"Service">
<#assign entityList = pojo.shortName.toLowerCase() + "s">
<#assign entityvar = pojo.shortName.toLowerCase()>
<#assign entityClass = pojo.importType(pojo.qualifiedDeclarationName)>

/**
 * ${entityClass}��Action�࣬�����˳���CRUD����.
 * @see ${pojo.getQualifiedDeclarationName()}
 * @author Hibernate Tools(quickj generator v1.0)
 */

public class ${entityClass}Action extends ${pojo.importType("cn.quickj.simpleui.action.SimpleUIActionSupport")}{
	@${pojo.importType("com.google.inject.Inject")}
	private ${declarationName} ${entityvar};
	@${pojo.importType("com.google.inject.Inject")}
	${pojo.importType(package+".service."+entityClass+"Service")} ${serviceName};
	private ${pojo.importType("java.utils.Collection<"+entityClass+">")} ${entityList};
	private String checkedIds;
	/**
	 * �г�Company�б�
	 */	
	public void index(){
		${entityList} = ${serviceName}.findAll${entityClass}(1000);
		render("${entityvar}/list.html");
	}
	/**
	 * ����${entityClass} Example����${entityvar}.
	 */	
	public void list(){
		${entityList} = ${serviceName}.find${entityClass}ByExample(${entityvar});
		render("${entityvar}/list.html");
	}
	/**
	 * �½�һ��${entityvar}
	 */	
	public void create(){
		render("${entityvar}/edit.html");
	}
	/**
	 * ׼���༭һ��${entityvar}��
	 * @param id
	 */	 
	public void edit(String id){
		${entityvar} = ${serviceName}.get${entityClass}(id);
		render("${entityvar}/edit.html");
	}	
	/**
	 * ���������޸ĺ󱣴档
	 */	 
	public void save(){
		if(${entityvar}.getId()==null){
			${serviceName}.save(${entityvar});
			setMessage("�����ɹ�!");
		}else{
			${serviceName}.save(${entityvar});
			setMessage("����ɹ�!");
		}
		render("${entityvar}/list.html");
	}
	
	/**
	 * ɾ��һ��
	 * @param id
	 */
	public void delete(String id){
		${serviceName}.delete${entityClass}(id);
	}
	/**
	 * ɾ������ѡ�еı���
	 */
	public void delete(){
		${serviceName}.delete${entityList}(checkedIds);
	}
	
	public Collection<${entityClass}> get${entityClass}s() {
		return ${entityList}
	}
	public ${entityClass} get${entityClass}() {
		return ${entityvar}
	}
	public void setCheckedIds(String checkedIds) {
		this.checkedIds = checkedIds;
	}
}
</#assign>
 
${pojo.generateImports()}
${classbody}

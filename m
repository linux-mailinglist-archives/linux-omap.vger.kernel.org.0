Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 938335BCD0A
	for <lists+linux-omap@lfdr.de>; Mon, 19 Sep 2022 15:25:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229878AbiISNZI (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 19 Sep 2022 09:25:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56182 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229795AbiISNZH (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 19 Sep 2022 09:25:07 -0400
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2089.outbound.protection.outlook.com [40.107.20.89])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 36BA37653;
        Mon, 19 Sep 2022 06:25:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lEtrp3dMvpn6RYX1Gd+LP5TzK3fXByFUud02QAIpu90L/5BIbNeibxtAA8PRvrJ3CfJoy7nBasefI+jJPojxc5xVtxYg7DEX305o8jNTWEy8USjN4wJCARtgt/LT3z5D5Pvsa4Gpi1mzjx4/yj1hEFIrryHcuuRRKpEj67eLk10n95jXEnILJVR0HzClE8m2DJsk79s6fRYjX5ofPUWaMTKjEYxgn8JAu77DXRmqV//wzukrDNFGCBj+GmLuf901vFw0H98bOKRe+ZN0NHN7GJ+NcWTAAiWiaArHkFmt0pcNbR8CI+PDr1KPTZWyfXqkTsUWi3g7x5ygdfwe7QuLCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EcOk7g6m6tmeLRiE307wFaPGZtj+5zdyMsyb4jwJZik=;
 b=nO7CQBaYl3ZQ31KnXbCtZkrW7VbMRQfChNEtsSy8lRcVch4/VCCwf7nNgBskH2JCAJ+OdktgpXke742YGQY3lnP3brZH/p2uI2M3JTRzbIQDM9UjeIPR5O7BW0UNjQgLDmu9eXfXQfASqeFSideVIlIOE2vxfNHbpeHRGkPmLBO0B/mvchhefAZ0UnVK0+2yWa1MgInM3O1ZY9dwHCQC70qx2XgH+t4V53nyFJOfUTJC0/bzGXnkpnZiXaERf0rNXXjfJ3UBjpb1+4l/ztOSBqns43GH27ttiwdmbw/2dvf/395R7qTsgt87vIBQowNhdmYLJkliydFM51btDLcr8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EcOk7g6m6tmeLRiE307wFaPGZtj+5zdyMsyb4jwJZik=;
 b=WdWVNHDL3yfXlOZwftgvyh+qo78LDl3Y2TfTApeV3zfDEOeSZ0R93MZ16Nr0fV0MmewTmqqMVC86+jZk8ujAtgKACwXzVlQ3vea+ABiYufuH4rUA5PxHDfAT0RUrrlGHoqUVSI+5Ntcg3CKGU5PfNtN1KWOgBmZyjKokbFICkNecuiFNNPlNN1roGu5yoGK5hrOGLDACxdDYEb22V5MDJ1eqo8EUIUNBps9ftzvNd7pxRn7XBHPWfEjdylajIGl2lXxp+zdO9T4cKPo8KvlFbZF/BTS6Q3sAq8XmbvGGMXr9grqaMYXAPlM6zV9qw91mXY7x1cYzq62aWaDEZ3zcdw==
Received: from PAXPR10MB5520.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:23e::20)
 by AS4PR10MB6278.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:58d::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5632.19; Mon, 19 Sep
 2022 13:25:03 +0000
Received: from PAXPR10MB5520.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::25f6:de51:14d3:5656]) by PAXPR10MB5520.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::25f6:de51:14d3:5656%4]) with mapi id 15.20.5632.016; Mon, 19 Sep 2022
 13:25:03 +0000
From:   "Niedermayr, BENEDIKT" <benedikt.niedermayr@siemens.com>
To:     "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "krzysztof.kozlowski@linaro.org" <krzysztof.kozlowski@linaro.org>,
        "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>
CC:     "rogerq@kernel.org" <rogerq@kernel.org>,
        "tony@atomide.com" <tony@atomide.com>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>
Subject: Re: [PATCH v5 2/3] memory: omap-gpmc: add support for wait pin
 polarity
Thread-Topic: [PATCH v5 2/3] memory: omap-gpmc: add support for wait pin
 polarity
Thread-Index: AQHYzAuajWmeLYXeQ0i8d4Z1OtIEx63mvdaA
Date:   Mon, 19 Sep 2022 13:25:03 +0000
Message-ID: <f6f59421ac9b0e2c0b85918282c33f325726c4bd.camel@siemens.com>
References: <20220916120749.2517727-1-benedikt.niedermayr@siemens.com>
         <20220916120749.2517727-3-benedikt.niedermayr@siemens.com>
         <6dd3d41b-eb75-3754-8a17-a8cb4bc838a8@linaro.org>
In-Reply-To: <6dd3d41b-eb75-3754-8a17-a8cb4bc838a8@linaro.org>
Reply-To: "Niedermayr, BENEDIKT" <benedikt.niedermayr@siemens.com>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR10MB5520:EE_|AS4PR10MB6278:EE_
x-ms-office365-filtering-correlation-id: 20092651-54dc-46e8-4c8c-08da9a425c35
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 1HzJQXpDlfVRkd+XWg4u2eSSfeEJ2MFEG5B7zV2454jmGiiZWdKyjQ1oHw8tYLQR8diwHWp0RbsTPeRaKQxAJeL0X9q7a9B/GSSCNVEz2J9SeqDQQ6MOl7L/cmHp0YcbgZmh9atmagAogwZKdi6uAS8jkmZh+xhbCaMx0CzKESJbguz3HW5e++kCRrMhJAmaCiIc2K+/CPsz2d9vTqNmL/0O83wURpk7CCwwWe2BNAw7jSdlZQjZxtU+2i++CXwWYvsHBGNiPhqoYF9bM2rIJMR5JNCMS1QNfy8FxeXED0H5hWmgOQsqMRCycJ5jcEV1+ZwQy5ZtEZvP1+56stpwAdhOgUnPM/noQGDLJU+/97lSz7pEasrwPF7Vu8RxM6s91OV09nnI17MybqTZ0yVPnKteYeicLiPqjP3HEnMiWQJU/dkc+YUl/Bid1fLZYxZaUPa3Omuic87QXap5RFPDTftENOcXiJLWXKBlvofKpCgAbzLdCl/rJGrtuOBirrSBCn0ix+pUmA354zeNMRCp9I9wIvNO8JLdPPifGxRe8XBiv3J7k9MYOl8nDAB4FYkxLXXUxKYQ18s4Kfv88K9/FC8aPna+sqJBVOWvVU1Vdskj8yF33M6+CbHbaTYRoiyFdDQhNpQdL7TGJ83JHUyAUzQdwMJkubsHbOq2f+bCJpNd+bK05jwQyJSjMWgxx1w3iQH+svEGOuL2a66wuEHU+axXhjx1izCnccaEw0Cpyp4uhNduD2h745/e2/BD8N65CScGNO/uMmcSVWhhMPy6mw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR10MB5520.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(366004)(396003)(346002)(376002)(136003)(451199015)(5660300002)(186003)(2616005)(316002)(54906003)(53546011)(8936002)(38100700002)(86362001)(76116006)(6512007)(6486002)(6506007)(38070700005)(4326008)(3450700001)(66446008)(71200400001)(2906002)(36756003)(478600001)(82960400001)(110136005)(83380400001)(64756008)(91956017)(66476007)(66556008)(8676002)(66946007)(122000001)(41300700001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SVM0dm96U0djV01iQUd4Zko5bG9oUXdMMEY3VFJMY1J3UFVtVXdDWUs0Tm4y?=
 =?utf-8?B?R1JGWW1MN1NJVGZYU0hEOEp6SEVQUmRoVlYyZ2xQbk4yYXVJUktkUVVXMEw1?=
 =?utf-8?B?c0p6OG5qSmRQeEpqSlpGOVluSldzTU1yNlQxWCtzQTQ2dHpLcnNNeEFTb1k0?=
 =?utf-8?B?dTdKb1RxOTFLTXJoUXM2UkR5N1BwTGFIQjRScUJLZlFlaDZqaEdZQWlNL0Y0?=
 =?utf-8?B?WTlwbGxWL3ZxM1d1N01tblNKS0ZTaFozUFVDZW00SjYyWncvajJTOWpGVk8z?=
 =?utf-8?B?YVczeXJTUDFaL05CZzNCQU5NVjBPeEE4VHIzZ3YyeU02cGYrVk1KOGFCRHR1?=
 =?utf-8?B?alBzd3pEaDR3a01ONDVZYmVLNzU5UGsvZzZjT2JpZThTVStuNGhIeFljam9o?=
 =?utf-8?B?ZVhLYXlXTGJ6MzBFMzZST1F1MWRSSjVjUHpsR0JBa3NLRUVwZXErVnRkOVl4?=
 =?utf-8?B?WlF3VGNtZk83V0o4NEdIbUJwNGFrVXFIMU5raktkS1AvRjcyQWdUNjU3cllX?=
 =?utf-8?B?TWRHMFgwb0UveFVZdkpQcGpTREVYbktoYVNCV0hlcHVJdS9pQ0RFZ2IrN3lx?=
 =?utf-8?B?SFpBTFFPWXIrd3VhbGJvcmVTcFF4VkhnWVNoMElhbFBCU0Z2ZGFCK3Vpdkxt?=
 =?utf-8?B?STVBcGtWT2VORGJrSUR0SndzQWlrVnBaZXd5L0dlQ3VNN3RqMUduRDlxd0RZ?=
 =?utf-8?B?TEpESXE3allzWXZQK2Y3UGpYcUV0TDF0aWpSYUtIaGN2bXVZc3pMVndoSm5a?=
 =?utf-8?B?QkNnZzBKN3lnVkM5Yjk5c1Y2Z1ZadkNHTktlLzg3WWJsd2JqMWtlM3hJZjZa?=
 =?utf-8?B?UjZrUGxLWFd2NmU1TlFOK044cGsrYXdoaWJKd2hkR3o5RWZUSGE3NFNYTDhQ?=
 =?utf-8?B?a2E0czNFdCs3a21hY1p2SmZ4RDZEQWJzanlJMGo5VFJpT3hXWDBPdGRPWE1P?=
 =?utf-8?B?NFp4QVNjeTdjZmd5a3FDY2lsVE92YWt1aWU1YTNZVHBQeTdaWkZ3STBkM05D?=
 =?utf-8?B?RnUxMThVcFJORDdaQUoxTTk2QWlLK2V1bW9iK3lZUGprVS82eHNWbVQ3aXp6?=
 =?utf-8?B?cUtPbDVHeXMrVHZERXVQNmJEK0pXLys1Y2Z2Sk9XdkFCcXcwY3ZMRC9vRlZD?=
 =?utf-8?B?cHdITDFvRllTL0FRczVTQ0hQK3JtNHNCNjF1ZE5naTIyb2MrV1poMG1WTWhi?=
 =?utf-8?B?MEVwdzRpTm1vQTNlWVF4eXJLL3FCT2dJRTFOakNYRTloenphbW05RkpPc3Bs?=
 =?utf-8?B?TDJpaUMwMFB3VmZNaUNFZVZXMFdxdWVDYkl0NHJqeUpWcm05eE1jWGdJUlBp?=
 =?utf-8?B?d0RSemsxZkpub0xUQnhZaERueDg5bDExNGdUa3doWDR2NmkrdjJENDErQU5E?=
 =?utf-8?B?ZURiNFNaWjU2SmprNksybENKV3J1emRJRDEwbjQyVTBNbjUwNUIyZ1prdXZU?=
 =?utf-8?B?eFZvK3pkdUhUK3ZOZFlna1pOSzFITGJPaHpZaW1WRElVZ2IwN2JFUGpvd3pu?=
 =?utf-8?B?NWV4dXQ2bGFDK2NkZXQyZ0x1SmlDSnozWWZwQ1ZFTFBYbXdMZlZvRDJ4VC91?=
 =?utf-8?B?S25NVnhEbkI5UGZrN0x6dW1zNjZ6eHFRQXdXV3YvMkVuNDVIMXpWbjNuY29j?=
 =?utf-8?B?c0gxdzIrVERiNnRSbzgyUUZCb04rL21kN2JpTDAzbjBoMDhzT0VweGRXaGtP?=
 =?utf-8?B?R2ZtcEdBaTJrU2pSNnJrT1Z6VC9sYS9CS2pxY21nT3RZREMyd250SkI3MDlB?=
 =?utf-8?B?M05LK3hsYUYwTmR1T25aekQ4Y0FuWTM4ZGhrS3ljWk4vbVRRYnRPSUJoOFFM?=
 =?utf-8?B?R0V6K0JVZEhaQitxU3VlK0RzbWZyNW9DbGFZZnIzZlpvY2VVRkZ3ZkhxdmJS?=
 =?utf-8?B?a3FHUTJ6eWwvWCtnZklldTFLVUw0alAxbXJhckd6WlR5c2xoTGRTdStSM0NL?=
 =?utf-8?B?UFFXeVViVDk1V2pCQXY4RlVjSTBscnVMQTNGQ1dPMTJGNHMzZWhEN0xsSlAv?=
 =?utf-8?B?VDZNbmRsRm5YQUo0TGxVSDhBOHBkUjluN0E4WGx6RFJhbktaK2lDa2dtVGY2?=
 =?utf-8?B?TEpldFkvNHVPY0wyQWdGS3ZGWlA0c2l1MVQxR2c2MTJtbDN5RzBEdE4vc29j?=
 =?utf-8?B?cmJBbzcvYi81UUpUM1RTb0ZnR0JJYWdWOStPS1M2KzY5MzA0NUZReUxaeTdE?=
 =?utf-8?B?VjdDcU96cUtmRzlUS0RiTlg5Ukl5SC9jOW8rWmFLMlg4UFI4eWZNWVFudytp?=
 =?utf-8?Q?daqF/7uJVfJchA986VtEVTYhGPQJYGbtYgj9kE5s98=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <1622A905FEA0864EB03F6F13355A413A@EURPRD10.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAXPR10MB5520.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 20092651-54dc-46e8-4c8c-08da9a425c35
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Sep 2022 13:25:03.1706
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yl4IqFba+qMLE2dALU02d6MTSLMcKvIPwRpv2pkgSAmmNX8MEv9x3yR4UtdkzShT4C+y+lylLvr6P6LJpCFQFzVfFCt93bJMv28ayOJqh4E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR10MB6278
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

SGkgS3J6eXN6dG9mLA0KDQpPbiBNb24sIDIwMjItMDktMTkgYXQgMTE6MzggKzAyMDAsIEtyenlz
enRvZiBLb3psb3dza2kgd3JvdGU6DQo+IE9uIDE2LzA5LzIwMjIgMTQ6MDcsIEIuIE5pZWRlcm1h
eXIgd3JvdGU6DQo+ID4gRnJvbTogQmVuZWRpa3QgTmllZGVybWF5ciA8YmVuZWRpa3QubmllZGVy
bWF5ckBzaWVtZW5zLmNvbT4NCj4gPiANCj4gPiBUaGUgd2FpdHBpbiBwb2xhcml0eSBjYW4gYmUg
Y29uZmlndXJlZCB2aWEgdGhlIFdBSVRQSU48WD5QT0xBUklUWSBiaXRzDQo+ID4gaW4gdGhlIEdQ
TUNfQ09ORklHIHJlZ2lzdGVyLiBUaGlzIGlzIGN1cnJlbnRseSBub3Qgc3VwcG9ydGVkIGJ5IHRo
ZQ0KPiA+IGRyaXZlci4gVGhpcyBwYXRjaCBhZGRzIHN1cHBvcnQgZm9yIHNldHRpbmcgdGhlIHJl
cXVpcmVkIHJlZ2lzdGVyIGJpdHMNCj4gPiB3aXRoIHRoZSAiZ3BtYyx3YWl0LXBpbi1wb2xhcml0
eSIgZHQtcHJvcGVydHkuDQo+ID4gDQo+ID4gU2lnbmVkLW9mZi1ieTogQmVuZWRpa3QgTmllZGVy
bWF5ciA8YmVuZWRpa3QubmllZGVybWF5ckBzaWVtZW5zLmNvbT4NCj4gPiAtLS0NCj4gPiAgZHJp
dmVycy9tZW1vcnkvb21hcC1ncG1jLmMgICAgICAgICAgICAgIHwgMjcgKysrKysrKysrKysrKysr
KysrKysrKysrKw0KPiA+ICBpbmNsdWRlL2xpbnV4L3BsYXRmb3JtX2RhdGEvZ3BtYy1vbWFwLmgg
fCAgNiArKysrKysNCj4gPiAgMiBmaWxlcyBjaGFuZ2VkLCAzMyBpbnNlcnRpb25zKCspDQo+ID4g
DQo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbWVtb3J5L29tYXAtZ3BtYy5jIGIvZHJpdmVycy9t
ZW1vcnkvb21hcC1ncG1jLmMNCj4gPiBpbmRleCBlYTQ5NWU5Mzc2NmIuLjI4NTNmYzI4YmNjYyAx
MDA2NDQNCj4gPiAtLS0gYS9kcml2ZXJzL21lbW9yeS9vbWFwLWdwbWMuYw0KPiA+ICsrKyBiL2Ry
aXZlcnMvbWVtb3J5L29tYXAtZ3BtYy5jDQo+ID4gQEAgLTEzMiw2ICsxMzIsNyBAQA0KPiA+ICAj
ZGVmaW5lIEdQTUNfQ09ORklHX0RFVl9TSVpFCTB4MDAwMDAwMDINCj4gPiAgI2RlZmluZSBHUE1D
X0NPTkZJR19ERVZfVFlQRQkweDAwMDAwMDAzDQo+ID4gIA0KPiA+ICsjZGVmaW5lIEdQTUNfQ09O
RklHX1dBSVRQSU5QT0xBUklUWShwaW4pCShCSVQocGluKSA8PCA4KQ0KPiA+ICAjZGVmaW5lIEdQ
TUNfQ09ORklHMV9XUkFQQlVSU1RfU1VQUCAgICAgKDEgPDwgMzEpDQo+ID4gICNkZWZpbmUgR1BN
Q19DT05GSUcxX1JFQURNVUxUSVBMRV9TVVBQICAoMSA8PCAzMCkNCj4gPiAgI2RlZmluZSBHUE1D
X0NPTkZJRzFfUkVBRFRZUEVfQVNZTkMgICAgICgwIDw8IDI5KQ0KPiA+IEBAIC0xODgyLDYgKzE4
ODMsMTcgQEAgaW50IGdwbWNfY3NfcHJvZ3JhbV9zZXR0aW5ncyhpbnQgY3MsIHN0cnVjdCBncG1j
X3NldHRpbmdzICpwKQ0KPiA+ICANCj4gPiAgCWdwbWNfY3Nfd3JpdGVfcmVnKGNzLCBHUE1DX0NT
X0NPTkZJRzEsIGNvbmZpZzEpOw0KPiA+ICANCj4gPiArCWlmIChwLT53YWl0X3Bpbl9wb2xhcml0
eSAhPSBXQUlUUElOUE9MQVJJVFlfREVGQVVMVCkgew0KPiA+ICsJCWNvbmZpZzEgPSBncG1jX3Jl
YWRfcmVnKEdQTUNfQ09ORklHKTsNCj4gPiArDQo+ID4gKwkJaWYgKHAtPndhaXRfcGluX3BvbGFy
aXR5ID09IFdBSVRQSU5QT0xBUklUWV9BQ1RJVkVfTE9XKQ0KPiA+ICsJCQljb25maWcxICY9IH5H
UE1DX0NPTkZJR19XQUlUUElOUE9MQVJJVFkocC0+d2FpdF9waW4pOw0KPiA+ICsJCWVsc2UgaWYg
KHAtPndhaXRfcGluX3BvbGFyaXR5ID09IFdBSVRQSU5QT0xBUklUWV9BQ1RJVkVfSElHSCkNCj4g
PiArCQkJY29uZmlnMSB8PSBHUE1DX0NPTkZJR19XQUlUUElOUE9MQVJJVFkocC0+d2FpdF9waW4p
Ow0KPiA+ICsNCj4gPiArCQlncG1jX3dyaXRlX3JlZyhHUE1DX0NPTkZJRywgY29uZmlnMSk7DQo+
IA0KPiBXaGF0IGhhcHBlbnMgaWYgd2FpdCBwaW4gaXMgc2hhcmVkIGFuZCB5b3UgaGF2ZSBkaWZm
ZXJlbnQgcG9sYXJpdGllcyBpbg0KPiBib3RoIG9mIGRldmljZXM/DQpJbiB0aGlzIGNhc2UgdGhl
IHNlY29uZCBvbmUgd2lucyBhbmQgd2lsbCBvdmVyd3JpdGUgdGhlIHBvbGFyaXR5IG9mIHRoZSBm
aXJzdCBvbmUuDQpCdXQgdGhhdCB3b3VsZCBiZSB0aGUgcmVzdWx0IG9mIGEgbWlzY29uZmlndXJh
dGlvbiBpbiB0aGUgRFQuIA0KDQpJJ20gbm90IHN1cmUgaG93IHRvIHByb2NlZWQgaGVyZT8gRG9l
cyBpdCBtYWtlIHNlbnNlIHRvIGFkZCBhIGNoZWNrIGZvciBkaWZmZXJlbnQgDQp3YWl0cGluIHBv
bGFyaXRpZXM/DQoNCg0KPiANCj4gPiArCX0NCj4gPiArDQo+ID4gIAlyZXR1cm4gMDsNCj4gPiAg
fQ0KPiA+ICANCj4gPiBAQCAtMTk4MSw3ICsxOTkzLDIyIEBAIHZvaWQgZ3BtY19yZWFkX3NldHRp
bmdzX2R0KHN0cnVjdCBkZXZpY2Vfbm9kZSAqbnAsIHN0cnVjdCBncG1jX3NldHRpbmdzICpwKQ0K
PiA+ICAJCQkJX19mdW5jX18pOw0KPiA+ICAJfQ0KPiA+ICANCj4gPiArCXAtPndhaXRfcGluX3Bv
bGFyaXR5ID0gV0FJVFBJTlBPTEFSSVRZX0RFRkFVTFQ7DQo+ID4gKw0KPiA+ICAJaWYgKCFvZl9w
cm9wZXJ0eV9yZWFkX3UzMihucCwgImdwbWMsd2FpdC1waW4iLCAmcC0+d2FpdF9waW4pKSB7DQo+
ID4gKwkJaWYgKCFvZl9wcm9wZXJ0eV9yZWFkX3UzMihucCwgImdwbWMsd2FpdC1waW4tcG9sYXJp
dHkiLA0KPiA+ICsJCQkJCSAgJnAtPndhaXRfcGluX3BvbGFyaXR5KSkgew0KPiA+ICsJCQlpZiAo
cC0+d2FpdF9waW5fcG9sYXJpdHkgIT0gV0FJVFBJTlBPTEFSSVRZX0FDVElWRV9ISUdIICYmDQo+
ID4gKwkJCSAgICBwLT53YWl0X3Bpbl9wb2xhcml0eSAhPSBXQUlUUElOUE9MQVJJVFlfQUNUSVZF
X0xPVyAmJg0KPiA+ICsJCQkgICAgcC0+d2FpdF9waW5fcG9sYXJpdHkgIT0gV0FJVFBJTlBPTEFS
SVRZX0RFRkFVTFQpIHsNCj4gDQo+IFdBSVRQSU5QT0xBUklUWV9ERUZBVUxUIGlzIG5vdCBhbGxv
d2VkIGluIERULCBzbyB5b3UgY2FuIHNraXAgaXQuDQpUaGlzIHZhbHVlIGlzIG5vdCBhc3NpZ25l
ZCBmcm9tIHRoZSBEVC4gSXQgaXMgb25seSBhc3NpZ25lZCB3aXRoaW4gdGhlIEdQTUMgYW5kIHNl
cnZlcyBhcyBhIGluaXQNCnZhbHVlIChyaWdodCBiZWZvcmUgdGhlIGlmIGNsYXVzZSkuIFRoaXMg
aGVscHMgaW4gY2FzZSBubyBjb25maWd1cmF0aW9uIGZyb20gRFQgaXMgZG9uZSB3aGVyZSB0aGUg
DQpHUE1DIHJlZ2lzdGVycyBzaG91bGQgc3RheSB1bnRvdWNoZWQuDQoNCj4gDQo+ID4gKwkJCQlw
cl9lcnIoIiVzOiBJbnZhbGlkIHdhaXQtcGluLXBvbGFyaXR5IChwaW46ICVkLCBwb2w6ICVkKVxu
IiwNCj4gDQo+IGRldl9lcnIsIG5vdCBwcl9lcnINCg0KT2suIEkgZGlkbid0IHdhbnQgdG8gaW50
cm9kdWNlIGRldl8qIGZ1bmN0aW9ucy4gQ3VycmVudGx5IHByXyogZnVuY3Rpb25zIHdoZXJlIHVz
ZWQgYWxsIG92ZXIgdGhlIHBsYWNlLg0KDQo+IA0KPiA+ICsJCQkJICAgICAgIF9fZnVuY19fLCBw
LT53YWl0X3BpbiwgcC0+d2FpdF9waW5fcG9sYXJpdHkpOw0KPiANCj4gU2tpcCBfX2Z1bmNfXw0K
PiANCk9rLg0KDQo+ID4gKwkJCQlwLT53YWl0X3Bpbl9wb2xhcml0eSA9IFdBSVRQSU5QT0xBUklU
WV9ERUZBVUxUOw0KPiA+ICsJCQl9DQo+ID4gKwkJfSBlbHNlIHsNCj4gPiArCQkJcHJfZXJyKCIl
czogRmFpbGVkIHRvIHJlYWQgZ3BtYyx3YWl0LXBpbi1wb2xhcml0eVxuIiwgX19mdW5jX18pOw0K
PiANCj4gRGl0dG8uDQpPay4NCg0KPiANCj4gPiArCQl9DQo+ID4gKw0KPiA+ICAJCXAtPndhaXRf
b25fcmVhZCA9IG9mX3Byb3BlcnR5X3JlYWRfYm9vbChucCwNCj4gPiAgCQkJCQkJCSJncG1jLHdh
aXQtb24tcmVhZCIpOw0KPiA+ICAJCXAtPndhaXRfb25fd3JpdGUgPSBvZl9wcm9wZXJ0eV9yZWFk
X2Jvb2wobnAsDQo+ID4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvbGludXgvcGxhdGZvcm1fZGF0YS9n
cG1jLW9tYXAuaCBiL2luY2x1ZGUvbGludXgvcGxhdGZvcm1fZGF0YS9ncG1jLW9tYXAuaA0KPiA+
IGluZGV4IGM5Y2M0ZTMyNDM1ZC4uYzQ2YzI4MDY5YzMxIDEwMDY0NA0KPiA+IC0tLSBhL2luY2x1
ZGUvbGludXgvcGxhdGZvcm1fZGF0YS9ncG1jLW9tYXAuaA0KPiA+ICsrKyBiL2luY2x1ZGUvbGlu
dXgvcGxhdGZvcm1fZGF0YS9ncG1jLW9tYXAuaA0KPiA+IEBAIC0xMzYsNiArMTM2LDExIEBAIHN0
cnVjdCBncG1jX2RldmljZV90aW1pbmdzIHsNCj4gPiAgI2RlZmluZSBHUE1DX01VWF9BQUQJCQkx
CS8qIEFkZHItQWRkci1EYXRhIG11bHRpcGxleCAqLw0KPiA+ICAjZGVmaW5lIEdQTUNfTVVYX0FE
CQkJMgkvKiBBZGRyLURhdGEgbXVsdGlwbGV4ICovDQo+ID4gIA0KPiA+ICsvKiBXYWl0IHBpbiBw
b2xhcml0eSB2YWx1ZXMgKi8NCj4gPiArI2RlZmluZSBXQUlUUElOUE9MQVJJVFlfREVGQVVMVCAt
MQ0KPiANCj4gTWlzc2luZyBwcmVmaXguIFRoaXMgaXMgYSBnbG9iYWwgaGVhZGVyLg0KT2suIE1h
a2VzIHNlbnNlLg0KPiANCj4gPiArI2RlZmluZSBXQUlUUElOUE9MQVJJVFlfQUNUSVZFX0xPVyAw
DQo+ID4gKyNkZWZpbmUgV0FJVFBJTlBPTEFSSVRZX0FDVElWRV9ISUdIIDENCj4gPiArDQo+ID4g
IHN0cnVjdCBncG1jX3NldHRpbmdzIHsNCj4gPiAgCWJvb2wgYnVyc3Rfd3JhcDsJLyogZW5hYmxl
cyB3cmFwIGJ1cnN0aW5nICovDQo+ID4gIAlib29sIGJ1cnN0X3JlYWQ7CS8qIGVuYWJsZXMgcmVh
ZCBwYWdlL2J1cnN0IG1vZGUgKi8NCj4gPiBAQCAtMTQ5LDYgKzE1NCw3IEBAIHN0cnVjdCBncG1j
X3NldHRpbmdzIHsNCj4gPiAgCXUzMiBkZXZpY2Vfd2lkdGg7CS8qIGRldmljZSBidXMgd2lkdGgg
KDggb3IgMTYgYml0KSAqLw0KPiA+ICAJdTMyIG11eF9hZGRfZGF0YTsJLyogbXVsdGlwbGV4IGFk
ZHJlc3MgJiBkYXRhICovDQo+ID4gIAl1MzIgd2FpdF9waW47CQkvKiB3YWl0LXBpbiB0byBiZSB1
c2VkICovDQo+ID4gKwl1MzIgd2FpdF9waW5fcG9sYXJpdHk7CS8qIHdhaXQtcGluIHBvbGFyaXR5
ICovDQo+IA0KPiBTa2lwIHRoZSBjb21tZW50LiBZb3UganVzdCBjb3BpZWQgdGhlIG5hbWUgb2Yg
dmFyaWFibGUuIFN1Y2ggY29tbWVudHMNCj4gYXJlIHVzZWxlc3MuDQo+IA0KPiBXZSBkbyBub3Qg
aGF2ZSBLUElzIGluIGtlcm5lbCB0byBhY2hpZXZlIHNvbWUgY29tbWVudC1yYXRpby4uLg0KPiAN
Ck9rLCBtYWtlcyBzZW5zZS4NCg0KPiBCZXN0IHJlZ2FyZHMsDQo+IEtyenlzenRvZg0KDQo=

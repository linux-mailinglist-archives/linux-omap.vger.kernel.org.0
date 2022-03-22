Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 971684E3945
	for <lists+linux-omap@lfdr.de>; Tue, 22 Mar 2022 08:00:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237104AbiCVHBn (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 22 Mar 2022 03:01:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56590 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237101AbiCVHBl (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 22 Mar 2022 03:01:41 -0400
X-Greylist: delayed 322 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Tue, 22 Mar 2022 00:00:08 PDT
Received: from mx08-005c9601.pphosted.com (mx08-005c9601.pphosted.com [205.220.185.5])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A47AE5FF4
        for <linux-omap@vger.kernel.org>; Tue, 22 Mar 2022 00:00:07 -0700 (PDT)
Received: from pps.filterd (m0237837.ppops.net [127.0.0.1])
        by mx08-005c9601.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 22M4TodQ007112;
        Tue, 22 Mar 2022 07:54:41 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wago.com; h=from : to : cc :
 subject : date : message-id : content-type : content-transfer-encoding :
 mime-version; s=p012021; bh=yTlTzPsSG8ew9VDHEzgvq/a8osdbbLcJDHHl2i8+TdE=;
 b=IaAcRQWwW5pPKZluZhu4Zod0ndJnw0QCdmKXN8YW5JsQ0P673Fz5VISvPHnhm5V6cP0u
 MlbCMLFtwNuZTmvr53TpIr7b7ZR/5zCEEXGMq3PUJx4u2TNUgRAv287dov+PVKKaY6fF
 STLIMS/mnUylCssNWTDnXsEwjw5KfW7BpJPjgKGN6ELMrQ4Qk4vHyAoQXeoi+aYmoWrU
 irv5hnKManJGrFBf7h95ifK1uLkVRgFGKlX8IC3tb6xx/yxB35gHZr3l1jYpPxeZyQSH
 s7s56ReabM9wOogo/z/dqNlW0skf2x0aaTPT8XEJC6SriaOfY229bvY7drNHrR9QkI6b 6Q== 
Received: from mail.wago.com ([217.237.185.168])
        by mx08-005c9601.pphosted.com (PPS) with ESMTPS id 3ew4pcjn6u-5
        (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
        Tue, 22 Mar 2022 07:54:41 +0100
Received: from SVEX01011.wago.local (10.1.103.229) by SVEX01014.wago.local
 (10.1.103.232) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.21; Tue, 22 Mar
 2022 07:32:55 +0100
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (10.1.103.197) by
 outlook.wago.com (10.1.103.229) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.21 via Frontend
 Transport; Tue, 22 Mar 2022 07:32:55 +0100
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YH3YwMwSMPoHTAV5eIiIa+gMKyIOU+Yq9LxlmvCuOfIPESTwac+Dj21ntreWtpnpYJQ+zOujvUvut7OoG3hzBzvR4+5MxxcpAxQPq+rxLsPEWFlwdBycjkfmHyXn7sQ1HgifMbO3fVWU6V9nHnDOII0VMEkTYLE6Vq6s71ydLZQ7XpDwA1rcCShGKt5eDQl/KaPIncBUmrghvsaI8SbXtKarA3QmDaqTNTRiXkTdx5oSek56FoDq8DUNLpPbz9pnE8Gym0gDHoG9OyWC2S85HEWrsSKFAv/Fo5ygjpKNpRn47eqZ0FAT6vPfcUPvoaLz6iB3dXVS7n1eIm29hbJOLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yTlTzPsSG8ew9VDHEzgvq/a8osdbbLcJDHHl2i8+TdE=;
 b=gT84v4ZaXwLI4QroTO15g2eE9uRuI0DgcjvUoAewpm3WtF9ArL/Oj1u/kNjgqAjyJeCWzxReZ6D4Wa+ImQErXQkhqADmy2IPUsSlTiJ1Lj4cUxRxQbF+s2XVwDASjM3uBR/z1YKBTscwwkEGLaZGuBkRvhsJ79IXgxVgXA7LYbuOC0dmS/doPdwbJhFEBZ1DaZe8cRHnRkc5gEbs/WWUuz661Guq3c/pFvJEiGC+1zihf6fKaZtxQqTB8MJgxDLFRQnwEk5mZm2K6QJEj+G310m96jU/3gSIVbdBGp0NTT1NTZ6K1EKOlC09g3nFbT72n0+plPb9DeioowpQLSWaPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wago.com; dmarc=pass action=none header.from=wago.com;
 dkim=pass header.d=wago.com; arc=none
Received: from DB8PR08MB5097.eurprd08.prod.outlook.com (2603:10a6:10:38::15)
 by AM8PR08MB5588.eurprd08.prod.outlook.com (2603:10a6:20b:1d4::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.17; Tue, 22 Mar
 2022 06:32:54 +0000
Received: from DB8PR08MB5097.eurprd08.prod.outlook.com
 ([fe80::cc57:a7c3:cf03:e4cb]) by DB8PR08MB5097.eurprd08.prod.outlook.com
 ([fe80::cc57:a7c3:cf03:e4cb%6]) with mapi id 15.20.5081.023; Tue, 22 Mar 2022
 06:32:53 +0000
From:   =?iso-8859-1?Q?Sondhau=DF=2C_Jan?= <Jan.Sondhauss@wago.com>
To:     "grygorii.strashko@ti.com" <grygorii.strashko@ti.com>
CC:     "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>,
        =?iso-8859-1?Q?Sondhau=DF=2C_Jan?= <Jan.Sondhauss@wago.com>
Subject: [PATCH] drivers: ethernet: cpsw: fix panic when interrupt coaleceing
 is set via ethtool
Thread-Topic: [PATCH] drivers: ethernet: cpsw: fix panic when interrupt
 coaleceing is set via ethtool
Thread-Index: AQHYPbapsZNzoyO3w0eRMBgmDSKdYw==
Date:   Tue, 22 Mar 2022 06:32:53 +0000
Message-ID: <20220322063221.28132-1-jan.sondhauss@wago.com>
Accept-Language: en-DE, en-US, de-DE
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.35.1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: bad5426c-1ab2-436a-acf8-08da0bcdcbaf
x-ms-traffictypediagnostic: AM8PR08MB5588:EE_
x-microsoft-antispam-prvs: <AM8PR08MB5588E5C2FC01105440C5ABBD8A179@AM8PR08MB5588.eurprd08.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: HSPW6oy4xF6xMv8w4OXSRKWFvvlBEGcmScjBURVDFlW2ZLgd98HIrdbpETXwCa218RpTU/aPdifuHj7l7sQ6Km0/tI4MlOZhRB3RGQ4FENocspdHXqWL6vkCkMAYdwtuY/9mHdQv6kVApceuOS2AMLgZp67ZyvwM6E+Qmw6pSEBN/2wdZk+9OIB4SPPMPZtZbbaT6xK8RscNFC7AGTWUhpYyUcJYumUE+wkWE+nG+0Z1Up5BMvnHkQKHCUqY+xZi6bUqjd4qTtjbA88dR2FKF9KZaQlErJFKPQFRBnSrnCQXtvQhxSSa7PyMOlbmgFNPatq8r87YoxSFRcywb2UgA2EiFZzmEXXwjIIZi4MJ+y3877/VbgQlSLsr6tVAmSOkBZ1asgx68Cd6RFqXm4s+afA8NxhUTmGcmJmZYweX3CXz/rayY40Q6pBB0hmc7EHK2SvfaFv8J+dP7pMX9275zvbYCxKxnCJjpSjoPD1MrEvR4lP3uc+LHu9dyknlg/XmbFje/FOry/Qm5GeaMfZ4G20e0IZl9GWjWO8Nv/iCjL9xu0NPjUb3nfUpC+UylYSgxlgfE9Z+h+/2sI22aZSEkH8GNfvbmdzSEUwYG5ECuzSAi9v7LT4O2Ed+jxnT/nl/V6WZu1q/ZP0aUi2caYJXkye2rubffihAhbRqKefRnZcnlzWx5pTxO2MAt2EjiAznA7uhfBTY5clo06aWlfcGKw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR08MB5097.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(316002)(107886003)(8936002)(2616005)(186003)(26005)(1076003)(91956017)(66556008)(66476007)(64756008)(66446008)(66946007)(76116006)(86362001)(4326008)(8676002)(6486002)(508600001)(38100700002)(6512007)(6916009)(71200400001)(38070700005)(6506007)(54906003)(122000001)(2906002)(83380400001)(36756003)(5660300002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?hBnh15gLAXJP31ErXur+44o2QBzelSqkBfqNCf2nHKr2oDVaGIX2OtEtOT?=
 =?iso-8859-1?Q?CiO/MAfjc9kDJcwc7p2KaYeqXUiU+zoDgg6rqIJ+tow9968Vb6dU32VgEd?=
 =?iso-8859-1?Q?Dx4HCoeCFmJaDQ/JnX1NausNnsjaf/sQSh4aOQTBW2ybBUkhIyHalAF48+?=
 =?iso-8859-1?Q?iCUrJw/CLo7KSUCgqAmecaiNoFofJQicZFmp9Oe9G9dn5n9eqUZ+y8drLC?=
 =?iso-8859-1?Q?DENz5Fm7VhbnTrYXSCTfEGWae4IR+89ADh0sHjGLzLkmF8jXOin7Cmeyb9?=
 =?iso-8859-1?Q?Iu7Uc+maimKdPsrljx7tfxN7UgoQfJQaoSUkLNlkgIqy2OE+ab0ihLpzyh?=
 =?iso-8859-1?Q?lQq5ccccSwYZ3IOM1t6Tm92PqHnWBqrtfgM6eXV5Qr1n1AjGKzMVWe3cGr?=
 =?iso-8859-1?Q?hxVds0mad72P8ZUuPgW/j3+BK4V+sBknCsA7SwDHYoTwHSajsp0LNITF34?=
 =?iso-8859-1?Q?2LRjiGl39HyovAFzFqGpyJMfYIcN/DIDGOmQnKfUIDkOfSvrpL44zbW9A7?=
 =?iso-8859-1?Q?jYiY+R0l8fjU0w3n97SHPmh7IHwCwzbN5KD1gaPkZm0CPbnYDaOhOfInvX?=
 =?iso-8859-1?Q?UvQtGud2nhrWSI3appPtEqyOESGOkKtekbAyT7/BDB7v1f004LX4ttBnPX?=
 =?iso-8859-1?Q?G1uv03BmsBrOJMF5ek0HeKET8lllz4mrDU4LWqsUzBAt7PxkyFqHP8hwSX?=
 =?iso-8859-1?Q?VZLMD5IbqxhByIpKcuo1QfGtbLWYadPayWD3oZK7P1Qh5PpN2/ArpAXlRF?=
 =?iso-8859-1?Q?87S6+Gg0ogMNunKOuKcxwlncqIkOKK6oRApITRCFhVbF/Vau+IZ+AIdu+N?=
 =?iso-8859-1?Q?DB6q23EKHaOaf6kZIKz/DatXUwNI3r3A9gZ+tHlcKKVghWYWgdJ+eizIlt?=
 =?iso-8859-1?Q?S6X2HJeosuLhF5Oi2R755OUOQioVmuKCxA2hLFuUUbTfw0u8GGp9urZtqo?=
 =?iso-8859-1?Q?iEv/ydhe1WCDX+Ia1+zpKgxqXlKgqNcDO3hLw5lev2cCNUA1nkITxTtRpM?=
 =?iso-8859-1?Q?4e1fe4vmR4vz1TA0AfkewkfRFyFaS6HNBLf2k1M8B2dJ9xA1y/wV3ZVska?=
 =?iso-8859-1?Q?VuOq2i2wsRkvwpMsiGX2NdTdEWvgb8JY6y9RXVCDcvbQckZHVMfK+1RuJp?=
 =?iso-8859-1?Q?tFVkhEozO8ZGFMkAPqDEbATG9NO0z/zf4J+9Dhg4W7d1Juvz240Vrf1y6r?=
 =?iso-8859-1?Q?SuQDZCih73g/R2xgHsFAUT9VWEy3dawaj63f07BYrqkwnYOnP8E6cz0YUT?=
 =?iso-8859-1?Q?BpN1yxJDnKhd1vm2uI743HjRbGl+pvIPk+3jJcz9haS11ISbYGZw2TqlEm?=
 =?iso-8859-1?Q?72YxV2SjVQY+iKB3ibMUgeDBPcIzDNOzdBex0kQzxu5tqdVtGKVvKMoIRJ?=
 =?iso-8859-1?Q?V2MWIg3oPzy2+0X/F1ci7JosCheHTf7Jt3BDhqxVVdQEf2RJniHDaWwZOq?=
 =?iso-8859-1?Q?RTT+wxedelpMMZC378ahH9l9z37IWqI1vdJLQXybrgRGTiAXG6rANlbv1L?=
 =?iso-8859-1?Q?1NaM1Y45u0qG0Fh4IR5MdYvCmyo5uY3ceMUhku9IJtRw=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB8PR08MB5097.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bad5426c-1ab2-436a-acf8-08da0bcdcbaf
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Mar 2022 06:32:53.8741
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: e211c965-dd84-4c9f-bc3f-4215552a0857
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Oiqs0onkUpNsc/OkDzyS0ry7jPDS21UzjbOnM0g3dLbi6qHmEXMKCjM/W0UGnYijcnkaCGiqXYBOFYreL1c3yg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB5588
X-OriginatorOrg: wago.com
X-KSE-ServerInfo: SVEX01014.wago.local, 9
X-KSE-AttachmentFiltering-Interceptor-Info: protection disabled
X-KSE-Antivirus-Interceptor-Info: scan successful
X-KSE-Antivirus-Info: Clean, bases: 22.03.2022 03:58:00
X-KSE-BulkMessagesFiltering-Scan-Result: protection disabled
X-Proofpoint-GUID: 5x3_CPxXPGX_ALIIvEwtkQVgfX0dC_E1
X-Proofpoint-ORIG-GUID: 5x3_CPxXPGX_ALIIvEwtkQVgfX0dC_E1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.850,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-22_02,2022-03-21_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 impostorscore=0
 clxscore=1011 adultscore=0 mlxlogscore=530 priorityscore=1501
 suspectscore=0 malwarescore=0 lowpriorityscore=0 mlxscore=0 spamscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2203220041
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

cpsw_ethtool uses the power management in the begin and complete
functions of the ethtool_ops. The result of pm_runtime_get_sync was
returned unconditionally, which results in problems since the ethtool-
interface relies on 0 for success and negativ values for errors.
d43c65b05b84 (ethtool: runtime-resume netdev parent in ethnl_ops_begin)
introduced power management to the netlink implementation for the
ethtool interface and does not explicitly check for negative return
values.

As a result the pm_runtime_suspend function is called one-too-many
times in ethnl_ops_begin and that leads to an access violation when
the cpsw hardware is accessed after using
'ethtool -C eth-of-cpsw rx-usecs 1234'. To fix this the call to
pm_runtime_get_sync in cpsw_ethtool_op_begin is replaced with a call
to pm_runtime_resume_and_get as it provides a returnable error-code.

Signed-off-by: Jan Sondhauss <jan.sondhauss@wago.com>
---
 drivers/net/ethernet/ti/cpsw_ethtool.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/ti/cpsw_ethtool.c b/drivers/net/ethernet/=
ti/cpsw_ethtool.c
index 158c8d3793f4..5eda20039cc1 100644
--- a/drivers/net/ethernet/ti/cpsw_ethtool.c
+++ b/drivers/net/ethernet/ti/cpsw_ethtool.c
@@ -364,7 +364,7 @@ int cpsw_ethtool_op_begin(struct net_device *ndev)
 	struct cpsw_common *cpsw =3D priv->cpsw;
 	int ret;
=20
-	ret =3D pm_runtime_get_sync(cpsw->dev);
+	ret =3D pm_runtime_resume_and_get(cpsw->dev);
 	if (ret < 0) {
 		cpsw_err(priv, drv, "ethtool begin failed %d\n", ret);
 		pm_runtime_put_noidle(cpsw->dev);
--=20
2.35.1

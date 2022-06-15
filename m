Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D013954D412
	for <lists+linux-omap@lfdr.de>; Wed, 15 Jun 2022 23:59:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350179AbiFOV7z (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 15 Jun 2022 17:59:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50758 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349938AbiFOV7o (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 15 Jun 2022 17:59:44 -0400
Received: from EUR02-AM5-obe.outbound.protection.outlook.com (mail-am5eur02hn2245.outbound.protection.outlook.com [52.100.8.245])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 65E0253C76
        for <linux-omap@vger.kernel.org>; Wed, 15 Jun 2022 14:59:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=faDMCqky9HX3bSnT1QM6BEIvp/4OO1TPceUJkPo/GLNh1sZqpn13Zu+9iJQIHYManUoeIE0IHW7qplCDLd47FnjANTQ9U4G1W/3IRRSCXSr6dPdKBJJICoYFVRjbZ8o/rGE9zUol03h/TyIBrTgLOLF9Uwiir/r6iHoJHI6oblr0/FjxJbp3KFfQOI06D9sBz3lB0fSQQBIFRngReRP+kL8dlZCfHRDkpKjozIRyr8a8WG9COeaTQqkqsZ91MqjpGrXX97d9b2P+h8Hdfjyj0rUDgLNbkm7TQ4gatjCPV8SFs4jykXo6jbLgkmct/lyR7aiQ1a3e5HgMb7/1wBcfPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lQsm62DnO3DRMaTO7/AWxijWtNxIrL/VW/Qe6xhipJU=;
 b=bBALjzKKigqFMAwOjHoxCKsiwckkqDnDT/tpU0v/DNz66wa/paoY8yC3AoZqqD2ZBspT2/IdjhXuar7tP0v1ScY3cOeCfpUAU2qu1oEPXGab09UtqJ2b5gD3uPDWiyJ8iBDtQJnF26Gx+UIJKrWMUtlSBQgFj5PRJqEqKcbLdQTGqTdtVhg+NvFiNZ09ib95l2O2jgTOdeb+xZGsC1dLEwLinWWtb8bR9k97mFxuNpn1YZGxp/ifldl9U7gt7tER228uNg+fd1QJlRVsW4YOUCH2V2gsJPoOpvz9SThIWsLZoM4cJYRjndVMf8ziiqoVVXIyCj/mZUAqOItXRgOI/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=permerror (sender ip
 is 91.151.71.70) smtp.rcpttodomain=vger.kernel.org
 smtp.mailfrom=solairedirect.co.za; dmarc=none action=none
 header.from=solairedirect.co.za; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=solairdirect.onmicrosoft.com; s=selector1-solairdirect-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lQsm62DnO3DRMaTO7/AWxijWtNxIrL/VW/Qe6xhipJU=;
 b=WJvlpvcvCUqRhkV+kKytTGcBsSpTgjdAFj45CeLp3EtD6zPTQuE9XB6K3JE1qjLiA/7UVo2yVQD74Rchk1SqIaM/EQ9u4NoE9nn/INwo/2ssWKBR96vSAgGRdgSFHgKAIEiv2I+SIwUpD1TjqOXNFOAXTFuwQLyyI0p08yYIQ4g=
Received: from DB6PR0601CA0011.eurprd06.prod.outlook.com (2603:10a6:4:7b::21)
 by HE1PR0602MB2747.eurprd06.prod.outlook.com (2603:10a6:3:d9::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.16; Wed, 15 Jun
 2022 21:59:41 +0000
Received: from DB5EUR01FT086.eop-EUR01.prod.protection.outlook.com
 (2603:10a6:4:7b:cafe::9d) by DB6PR0601CA0011.outlook.office365.com
 (2603:10a6:4:7b::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.14 via Frontend
 Transport; Wed, 15 Jun 2022 21:59:40 +0000
X-MS-Exchange-Authentication-Results: spf=permerror (sender IP is
 91.151.71.70) smtp.mailfrom=solairedirect.co.za; dkim=none (message not
 signed) header.d=none;dmarc=none action=none header.from=solairedirect.co.za;
Received-SPF: PermError (protection.outlook.com: domain of solairedirect.co.za
 used an invalid SPF mechanism)
Received: from SDSV152-VM.solairedirect.lan (91.151.71.70) by
 DB5EUR01FT086.mail.protection.outlook.com (10.152.5.118) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.5353.14 via Frontend Transport; Wed, 15 Jun 2022 21:59:40 +0000
Received: from [206.72.197.122] ([206.72.197.122] unverified) by SDSV152-VM.solairedirect.lan with Microsoft SMTPSVC(8.5.9600.16384);
         Thu, 16 Jun 2022 00:00:12 +0200
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Description: Mail message body
Subject: Hi
To:     linux-omap@vger.kernel.org
From:   "Emerald Johansson" <marketing@solairedirect.co.za>
Date:   Wed, 15 Jun 2022 17:59:34 -0400
Reply-To: emjo680@gmail.com
Message-ID: <SDSV152-VMXMJ8DQ3Tm0004701a@SDSV152-VM.solairedirect.lan>
X-OriginalArrivalTime: 15 Jun 2022 22:00:12.0526 (UTC) FILETIME=[497D40E0:01D88103]
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9f791119-a3ff-431c-60c8-08da4f1a58ed
X-MS-TrafficTypeDiagnostic: HE1PR0602MB2747:EE_
X-Microsoft-Antispam-PRVS: <HE1PR0602MB27471C667ED67A2DE325FFBDEBAD9@HE1PR0602MB2747.eurprd06.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?Jg24k5/T0mIE3O+lGCQ+qdkiJRCNM/2mcKy5ivztZ4+t3yN4oUTFhEUQIT?=
 =?iso-8859-1?Q?nP/eWs6jASa6WiXDpUvA+zlbAn73za4oWjj+kM/ZJ0QPFlbpfd6xZywq0h?=
 =?iso-8859-1?Q?p65vMbprz4n4WRbT/7I86KdrgGOXqDyih11tG6he0nTPalTRMArFd0bHhQ?=
 =?iso-8859-1?Q?T6ykQocK9oN2NyfepS2lE1j0AArb7M0dDnUt5xu8gO1y65k1rydtfQcL8p?=
 =?iso-8859-1?Q?aYVsy2QPtvk3TQPWj24VFU9D5OHiUbeIdTqv7WlF8uvAziqzS4QM0LKTgk?=
 =?iso-8859-1?Q?z4y00BfH3rHRm5TiivhnCSnKvtAPKWu5v5YvdIUz7eVqx+npApAGTx/1Xw?=
 =?iso-8859-1?Q?wspXzqDFsrXXvMb4YsrqY6x3rN51ImaamKo+j0vXsdm1jWOMXZ2fi6xrCE?=
 =?iso-8859-1?Q?KC8kun5UFv9eXKxv+ZoQusV9alXGzDkgG6Q58uw9IKGZYAEfvO2xVynq4+?=
 =?iso-8859-1?Q?XG1gCXJDG/gCykQ2n5BBJBLRE0M/lVljrl+LGlv/GpCUw+SM7ki+NHZp3m?=
 =?iso-8859-1?Q?qLtEx+W9pbMTZDPUI3wyr9PMIrU7nqEiZ56zft1EYENkFfOEzJGCUakM3+?=
 =?iso-8859-1?Q?iMcRRiHsaCRr7qDU4HrlrJmi3jTcWAunQMF8tl9MF+r6zAVjSHHZzo8KfR?=
 =?iso-8859-1?Q?zv/npNm4WMl4Rc0H2qzpDjUZ6vBcNcmYRv8Ac6GYbmS5ciIDpLpO/m2/D+?=
 =?iso-8859-1?Q?lKpc67KglgG6T3dbOSeLKvrfaMle9btEdpfSa/AX2pevHcVDqlIb8j12AR?=
 =?iso-8859-1?Q?rl9g3qwnYFFvg5/Trw4yNuE+AVnsFkScZntnVDjmGo77pMi9WkqQCaCMGg?=
 =?iso-8859-1?Q?Ks0O5rs9rF3dFTQS5Z7adnbiXP7jxWmX6rcFbNHjsnpJFIi3ogLbAfYvMX?=
 =?iso-8859-1?Q?VACdaSRBN0VGp8Yq5sjHuFI5fpDA86UeOEhsApCAsuY44xxoxBik3eshMw?=
 =?iso-8859-1?Q?BNrwVwRRMsnKpxLiEl55F4EMM087UBbyGgNjg52ckMoFJTlJWcr5iDApPg?=
 =?iso-8859-1?Q?RlupKUQoJXuYVW1i8ZYjxlm059Yu8AUIN7w8HE0GHCgdu36VtmSMeo6FZQ?=
 =?iso-8859-1?Q?9lZWfYuf5Z0PireXlLxJZKQ=3D?=
X-Forefront-Antispam-Report: CIP:91.151.71.70;CTRY:FR;LANG:en;SCL:5;SRV:;IPV:CAL;SFV:SPM;H:SDSV152-VM.solairedirect.lan;PTR:undef-71-70.c-si.fr;CAT:OSPM;SFS:(13230016)(346002)(136003)(396003)(39860400002)(40470700004)(46966006)(36840700001)(41300700001)(26005)(36860700001)(6666004)(956004)(5660300002)(508600001)(356005)(8936002)(82310400005)(2906002)(9686003)(4744005)(8676002)(40480700001)(40460700003)(2860700004)(47076005)(186003)(336012)(86362001)(81166007)(70206006)(6916009)(7116003)(70586007)(3480700007)(316002)(16900700008);DIR:OUT;SFP:1501;
X-OriginatorOrg: solairedirect.co.za
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jun 2022 21:59:40.5104
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f791119-a3ff-431c-60c8-08da4f1a58ed
X-MS-Exchange-CrossTenant-Id: 1c138fa9-0b91-4473-baea-5be5feac0f7e
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=1c138fa9-0b91-4473-baea-5be5feac0f7e;Ip=[91.151.71.70];Helo=[SDSV152-VM.solairedirect.lan]
X-MS-Exchange-CrossTenant-AuthSource: DB5EUR01FT086.eop-EUR01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0602MB2747
X-Spam-Status: No, score=4.1 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,FORGED_SPF_HELO,FREEMAIL_FORGED_REPLYTO,
        FREEMAIL_REPLYTO_END_DIGIT,RCVD_IN_DNSWL_NONE,SPF_HELO_PASS,
        T_SCC_BODY_TEXT_LINE,T_SPF_PERMERROR autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Level: ****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

I hope that you are at your best and doing well. The purpose of this letter=
 is seeking for a pen pal like friendship and I'd love to and be honored to=
 be friends with you if you do not mind.. If the Idea sounds OK with you, j=
ust say yes and we can take it on from there. I look forward to hear hearin=
g from you.. My name is Emerald From Sweden 36 years , this will mean a lot=
 to me to hear back from you.

Warm Regards.

Emerald

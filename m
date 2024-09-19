Return-Path: <linux-omap+bounces-2222-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EE05297C84E
	for <lists+linux-omap@lfdr.de>; Thu, 19 Sep 2024 13:06:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 676E11F255A9
	for <lists+linux-omap@lfdr.de>; Thu, 19 Sep 2024 11:06:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 69DF819CC13;
	Thu, 19 Sep 2024 11:06:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b="VydNeGTW"
X-Original-To: linux-omap@vger.kernel.org
Received: from APC01-PSA-obe.outbound.protection.outlook.com (mail-psaapc01on2067.outbound.protection.outlook.com [40.107.255.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7C3D19B3C0;
	Thu, 19 Sep 2024 11:06:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.255.67
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726743972; cv=fail; b=DsTysgQiEL+WahEYDh7uUtVvMEDQm4Y6k1Z6WY+fc2RMFFEoBnZYCzJDRLBivz2wiQLHaTPT5+dX+SWMH98RgpQnXdF51VEUT2rR8zTpIUbRuDD4xsGczF+4i2BMn0MeSZx65YaX4AS3Mb/ie9EcdANB1wPRm3c5YgNO7Ytcybs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726743972; c=relaxed/simple;
	bh=CPOs9yU1G612QvjFjHbWNHYehb6g1lMn18fXqOqANf0=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=u7qsGGopNKV/eASX0gW5DFV+jgSOkUf/EdPE6trL/Mk287Vsjf2Dz/BJ9o5WAHfE8Ylz886nS/PeADfbLxF79Ml6hqINQMoXiEilN5IS4dingN2xOJwuQSj++n3FoWGbg6vFw7c+N3lbCDl8SKQ/KtA7SUq8FKlRWkkcUxQufcw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com; spf=pass smtp.mailfrom=vivo.com; dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b=VydNeGTW; arc=fail smtp.client-ip=40.107.255.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vivo.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uMFQVbPnQlv6VM2MkhXtAvL779PF2IYCLxgqsW44qMjgl2Q4DB+cOSzIVwYCzoHx/RiVI0PvSJJVxwxyizEjYSLwBbd/DzhK/F8rL8MT4WN1mul3t94XADkk/c1bxiYVUONqtmi5K/sq16KS/SHLnzR2xUh0F79dRJrLMuBhmxI/W4l0Pb/cIC38YgGwNiJIlkqUjEgAjUUL7hfG8/wgBs6dsUquc7L+2b0/3XneWVvkNaPmA5TVip8a5def+pYk+UWXob5XHidUk5n1GZpAQ+As/PF2MKkv0UnNJCOdrY2NUT/bxU3XEphNwWh+e5NTIJND5V5uphMNbj4RVZgEyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6vfyrQi7IQPMDAoakIQA1dteH6EKSY3nwvOlHvvlVG0=;
 b=Ix8an4MzHkWhbSw2bUhRCfsu6Am1QmnLoQboOPsPcHBbxwZiSXDLh4j+rigfOPDU4WAuHFe2feS38FYhxLoAnjjnYF4IqZpVYCPiU46uHflx4h0OQ/mcyrj2FcbBUxvv4Y+8C5IuhMT2NDjZaiTzw7Fn/CuxYZXkIBznfB9+BPxeGORHlZKIQTE/TWsBNyh18lUGu9eo0vFGIfFCaocdOC2dCGQVghzZ+obbow4V4++I2QdEcavouZXOaLSJJCMSK8NzU4nqIGdCcHYlIsN5QXFJtYN6T8r0SPxWsI5iwCaw8Nfl44E9cYbO28dmRnhEPPnAbYOkK2cMD4ddncbcnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6vfyrQi7IQPMDAoakIQA1dteH6EKSY3nwvOlHvvlVG0=;
 b=VydNeGTWymjEPv3xUXin6HGrMSu/U3DIRLRYfTN4Nnr+R3TwAmiybOgL19nPampgWF5b6Y2jemfp4I3CiEm7ny62o4ofQ0W7h/P2JtyLzyfdJQ3nAZQq1RpzTwfwD2KbyCTJFPcvF0JUylr2t7qOAGGQg2EEqh5DqGHWth7yZvhXNE0cMSE+V5HQ9kTZ1OMiEqSBUpU8PpnMgyeMOhJFwzAV7qs1iI02TI2fd+ojhZet+oETRVWtfwi3PnGR97JUXeMbaSrK4E2Q3kvcGMW4NmzGi5YrzbKvE+IF0QecDJKPj8hkYcdWxiCUiiAO7BQhBMvKRZUk1ql0Y8QJyI4ovQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from KL1PR0601MB4113.apcprd06.prod.outlook.com (2603:1096:820:31::7)
 by SEZPR06MB5644.apcprd06.prod.outlook.com (2603:1096:101:a8::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7962.24; Thu, 19 Sep
 2024 11:06:03 +0000
Received: from KL1PR0601MB4113.apcprd06.prod.outlook.com
 ([fe80::7e85:dad0:3f7:78a1]) by KL1PR0601MB4113.apcprd06.prod.outlook.com
 ([fe80::7e85:dad0:3f7:78a1%4]) with mapi id 15.20.7962.022; Thu, 19 Sep 2024
 11:06:03 +0000
From: Yan Zhen <yanzhen@vivo.com>
To: gregkh@linuxfoundation.org,
	stern@rowland.harvard.edu,
	mathias.nyman@intel.com
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-omap@vger.kernel.org,
	opensource.kernel@vivo.com,
	Yan Zhen <yanzhen@vivo.com>
Subject: [PATCH v1] usb: host: fix typo in the comment
Date: Thu, 19 Sep 2024 19:05:17 +0800
Message-Id: <20240919110517.1793550-1-yanzhen@vivo.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TY2PR0101CA0017.apcprd01.prod.exchangelabs.com
 (2603:1096:404:92::29) To KL1PR0601MB4113.apcprd06.prod.outlook.com
 (2603:1096:820:31::7)
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: KL1PR0601MB4113:EE_|SEZPR06MB5644:EE_
X-MS-Office365-Filtering-Correlation-Id: 00015747-5498-485f-f515-08dcd89b0d2d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?WhpNBP0OvW+2jmJXhFmkey5McM+17rc3lRDwAXg+T1eRbnD82pruqM20KDW7?=
 =?us-ascii?Q?PVbVNf4++KIpmec8CvRCHapUmCtBVeigqfEZKy8vYLs6wxnCblptWAJDhGGv?=
 =?us-ascii?Q?Z1uY84rZ9ADU71F/BZrSQExZ3ENaRI/kebctP18MgEq7PZeQ1tZFMHiCe98L?=
 =?us-ascii?Q?jn+TWjC/qxEHxyPmckBhfv/zDfVAW9PACbY+z8/VubzgJe2iTuwEF8GzRsFN?=
 =?us-ascii?Q?OipCaEjSrOFOwGO1/ureQkT3F8XPEmSgcZtO0cP9bBTzfFojoCq8u9wjc7wx?=
 =?us-ascii?Q?rcjBGN8Zgtnd3O+50PRU2hrGFUxoPLYQwuhButy0eG+Tci+gj5/B2b5flEP6?=
 =?us-ascii?Q?2gVsd6GfFSk4c5tjUHxSykKoKpbha+Ip1R9SAEVrJuusJf1NGiZCRzVEPjjY?=
 =?us-ascii?Q?Vy5QU3KbnpUEhbUCUwTNfm7O5bMpjSyNuCYpI1wENnXWIx6SA3zPM//PAeuT?=
 =?us-ascii?Q?+hZbGrF0puxMu5jNOhL4g0YrbdShDFY5mpPH2jV+N1UQgZEBZ9uxj0o7A7DW?=
 =?us-ascii?Q?7W6z4KALnDF7LJ3lOT1QN3gVigA9lneNWQNVn8JppZE6iBdSu9zrop0B4dbW?=
 =?us-ascii?Q?q6NDJ/vehqj4F3UDBY3DmYjsi3Lb2PzJPUnrmmylhzw3QOjh6mGe40A9fBWj?=
 =?us-ascii?Q?jbUko2odkuKcfIJ1x84eEdtqenpmuWpjOjoeBWxlHK9XAt0LEz5bT4fC3ASw?=
 =?us-ascii?Q?w/9kvvrHctOtZRD+SPHgIkrddOFcHPCKzCEB+AKwBteLtvBjHb239HxYW4GT?=
 =?us-ascii?Q?pt12pVPtZR6ILU76SetsewDm3RdyjwIVsD9zNx7KQb8a5GCWZ0W21EyK0vyu?=
 =?us-ascii?Q?RtPPHWzyUrg3UizaE7HfXowNyDN4Fsi0L9WTYDfOAjgKCTpdqU+423xZjBke?=
 =?us-ascii?Q?1jjkIWTHnl7WF0DkbE7anzunKgd+rYZPqEbngp8kNmA4uIbtFgV+QEUUYlm3?=
 =?us-ascii?Q?r5mAL947GO6K6j8CGDIMXL1prcJdXD3uddT0PjNA0MJg19ISHmzHQG8wXajF?=
 =?us-ascii?Q?aeCuKYWSrkCQlg2iwM8WCAhs9OuUtYk3rfsgCBS3LZtAb1fTRU7pO6S2wo2y?=
 =?us-ascii?Q?La5RWAAyRyXn71unbvV7CR2SuGyAJaz1vahANpCo+V1YyhgPS/SVMIYHh64W?=
 =?us-ascii?Q?ncTrHkxC8sKlFiXZhZxZDpkKFX4zY0YF4i/8DlOqjwUpU3MGsoSNOVf6LOtt?=
 =?us-ascii?Q?gkdVK9+7kHR3qakaXjVaM4gW70pCUNA4TyehL+TlGWh5RG8mY476zF9Y2vQk?=
 =?us-ascii?Q?exqYPiJHp2h88Ovz4lCRVS55X+NyKohit4e/gMlQSVRqtNLFhNy6CSGJibbt?=
 =?us-ascii?Q?gQ3GeuRuCXF0hwGWnKR1Fr11NDHY2+Qv6zaeDxX9th6mxsjQ2z4t+f1xjLrY?=
 =?us-ascii?Q?xy+762R8pMSitv/SDzOudzbBmOiWwO+ZsBBvXY28HVA1OyaMTA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR0601MB4113.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?fRvA2hNCCCiGp8IFDrXO1QKqO3nWwKjvVAUpSOMip3aAWfJDRZSiBMMGbPC7?=
 =?us-ascii?Q?FB7+F3AvkvIurCDqaBLb/nuy2KsFrr5avEL6nwfnL/sBJh1L9tcuXErNsrV+?=
 =?us-ascii?Q?qw5IaWthXLmbYaDsJU2NUpVODsQxr6WFIhqv7JY449hyKaLgy8I9D+D/sDXO?=
 =?us-ascii?Q?xYsuZZ9STMlGlYK7evl09I+k4aDHM1iAtvo7t0UehZRsBMp+TstjYvVPsYEJ?=
 =?us-ascii?Q?UgVhfC7t4n5yaXxn+pdmysAF16HxQPDlb6pfihEDuQUY1Si4NRXGlBhGap/u?=
 =?us-ascii?Q?ojNG6L9i9GqoEWusxFdntykPFOksUJHhUWwdlkygDdUVgfI8LnmfqQtRAtlw?=
 =?us-ascii?Q?nsWCR9qWBZrfRZR/RWZsYYEJ7TMTgY6RgASxhU6geVgZM9G4x0m3KCUsMJCn?=
 =?us-ascii?Q?lS0aChyQTRYfNEndjXFcIIwW9oXID7GjvOQTahWSoCVcjYoP5SID5LeXaRqf?=
 =?us-ascii?Q?5d5eb2UMmRRI3pHJd+p4AGvmaP29h1LfnItj7T5AagHulj+3BVskD9PHR9HK?=
 =?us-ascii?Q?HFQm7kCCnbjZoY6//moILrpvqEZaAD/aRfQGRJqTBt8np1ETqN1loe/74l9A?=
 =?us-ascii?Q?pTfGi59rt5vkmMRd09zVPMFct0OCojooYbW+CoWLyzZrrA2pEgD5nzDVtIdj?=
 =?us-ascii?Q?JmSaNdvF0c5nd2DdaAGT8qzdIhd0Z3nr9OMLtQQNXH5//Cpy5kH9FtG6lG8r?=
 =?us-ascii?Q?LEdsR6/828egxi8096RE9N8byFpyioMhJnNaMg1KcgnG/bS4VIaT8BofTuoh?=
 =?us-ascii?Q?b+ckb6JYGHLHhbZVYbXhNvG/rg5nzw4RufSRZlNtvon6Dg2Ls32HpGiUZkm5?=
 =?us-ascii?Q?CGZV11kZyJHaY+/4Dwvx7j6eJAyxGVnSHGcyGKkMfvk3Y2PiKdTDUp/sd0Eu?=
 =?us-ascii?Q?d4HmdnuQWFqw3T0LPqP/nKuSYaspNfnCKKkmTQnxkK+e8wFQWmB2UZ1PA0+B?=
 =?us-ascii?Q?d/+CTX7PFSnpkp2zSCW0kYFhDUOcrYe9ikElrq9vshIqChbY5icbrh8muTeU?=
 =?us-ascii?Q?7nCERR68UKFtegZCN3px2gL2XjTb9/EPvuBNq/LHZACjQctt8PCG/bQhFGvU?=
 =?us-ascii?Q?JXs9jNmzjiIjntzyT13Fu7Y8gI4jGpvcvLhBe4oM86PzPn23z6GiU1hsR5+D?=
 =?us-ascii?Q?TBvvjDAFgGu6kx+75nPfU5fuL7l4o3SiWf7KlhaNVCndkwBhWM2hwiQE4wsc?=
 =?us-ascii?Q?lhSvageqeafCW01vL/Ojcle4/4AInRDeRBIP0c/FUxU/tQyZxBuLJd+SIzG9?=
 =?us-ascii?Q?0EA15ryNji21bwQK2Eb8eb4YDEMlMwXq/1v7Su3/zJ3CT4pql1qk3OUexraN?=
 =?us-ascii?Q?siyV1pTy2fu6QSR7CZtO85iJ17PldgSeFqCaD0P5nLNUYWHHV0JmkC6KtC0B?=
 =?us-ascii?Q?k6lOcE67bRiYkbumhr+xqKZvPDVro+oWdkkrc+8+r2npcvoXRWeuNMlaKbes?=
 =?us-ascii?Q?85sZkAK5KB+IyeGdrgiXs+4oSaHpawq598msrTburXPKyCkZc3JlzPT9SHqu?=
 =?us-ascii?Q?sBFxOH0a2wi7z3HjvqGLCAroatZwFmSFXnMPi8TDEi7ltTawFeozkHyN04eG?=
 =?us-ascii?Q?5t8kuFApR5BJApgx5+LUhNiNOb/V1al46r7E/EfC?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 00015747-5498-485f-f515-08dcd89b0d2d
X-MS-Exchange-CrossTenant-AuthSource: KL1PR0601MB4113.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Sep 2024 11:06:03.5726
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wvw725WRwpe9KI/t8HLUiWEVb+FCpaBMvBUyhzzCOH7sNox76bnyekrY0hA4Ju79jBl5oV05ZydfaNrpoHOjnA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR06MB5644

Correctly spelled comments make it easier for the reader to understand
the code.

Fix typos:
'calcalate' -> 'calculate',
'complted' -> 'completed',
'inidicator' -> 'indicator',
'detction' -> 'detection',
'allocte' -> 'allocate',
'controlles' -> 'controllers',
'initated' -> 'initiated',
'resumeable' -> 'resumable',
'aquires' -> 'acquires',
'tranfers' -> 'transfers',
'tranferred' -> 'transferred'.

Signed-off-by: Yan Zhen <yanzhen@vivo.com>
---
 drivers/usb/host/fhci-sched.c   | 4 ++--
 drivers/usb/host/octeon-hcd.c   | 2 +-
 drivers/usb/host/ohci-omap.c    | 2 +-
 drivers/usb/host/oxu210hp-hcd.c | 2 +-
 drivers/usb/host/r8a66597-hcd.c | 2 +-
 drivers/usb/host/xhci-hub.c     | 6 +++---
 drivers/usb/host/xhci-ring.c    | 6 +++---
 7 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/usb/host/fhci-sched.c b/drivers/usb/host/fhci-sched.c
index a45ede80edfc..c3acd410ce94 100644
--- a/drivers/usb/host/fhci-sched.c
+++ b/drivers/usb/host/fhci-sched.c
@@ -158,7 +158,7 @@ static int add_packet(struct fhci_usb *usb, struct ed *ed, struct td *td)
 	struct packet *pkt;
 	u8 *data = NULL;
 
-	/* calcalate data address,len and toggle and then add the transaction */
+	/* calculate data address,len and toggle and then add the transaction */
 	if (td->toggle == USB_TD_TOGGLE_CARRY)
 		td->toggle = ed->toggle_carry;
 
@@ -679,7 +679,7 @@ static void process_done_list(unsigned long data)
 
 DECLARE_TASKLET_OLD(fhci_tasklet, process_done_list);
 
-/* transfer complted callback */
+/* transfer completed callback */
 u32 fhci_transfer_confirm_callback(struct fhci_hcd *fhci)
 {
 	if (!fhci->process_done_task->state)
diff --git a/drivers/usb/host/octeon-hcd.c b/drivers/usb/host/octeon-hcd.c
index 19d5777f5db2..38878865f916 100644
--- a/drivers/usb/host/octeon-hcd.c
+++ b/drivers/usb/host/octeon-hcd.c
@@ -3346,7 +3346,7 @@ static int octeon_usb_hub_control(struct usb_hcd *hcd, u16 typeReq, u16 wValue,
 			break;
 		case USB_PORT_FEAT_INDICATOR:
 			dev_dbg(dev, " INDICATOR\n");
-			/* Port inidicator not supported */
+			/* Port indicator not supported */
 			break;
 		case USB_PORT_FEAT_C_CONNECTION:
 			dev_dbg(dev, " C_CONNECTION\n");
diff --git a/drivers/usb/host/ohci-omap.c b/drivers/usb/host/ohci-omap.c
index 21a6f6c55e07..974bc0ab6168 100644
--- a/drivers/usb/host/ohci-omap.c
+++ b/drivers/usb/host/ohci-omap.c
@@ -152,7 +152,7 @@ static int ohci_omap_reset(struct usb_hcd *hcd)
 
 			rh &= ~RH_A_NOCP;
 
-			/* gpio9 for overcurrent detction */
+			/* gpio9 for overcurrent detection */
 			omap_cfg_reg(W8_1610_GPIO9);
 
 			/* for paranoia's sake:  disable USB.PUEN */
diff --git a/drivers/usb/host/oxu210hp-hcd.c b/drivers/usb/host/oxu210hp-hcd.c
index 3f871fe62b90..9b665de568bc 100644
--- a/drivers/usb/host/oxu210hp-hcd.c
+++ b/drivers/usb/host/oxu210hp-hcd.c
@@ -885,7 +885,7 @@ static int oxu_buf_alloc(struct oxu_hcd *oxu, struct ehci_qtd *qtd, int len)
 	int a_blocks;	/* blocks allocated */
 	int i, j;
 
-	/* Don't allocte bigger than supported */
+	/* Don't allocate bigger than supported */
 	if (len > BUFFER_SIZE * BUFFER_NUM) {
 		oxu_err(oxu, "buffer too big (%d)\n", len);
 		return -ENOMEM;
diff --git a/drivers/usb/host/r8a66597-hcd.c b/drivers/usb/host/r8a66597-hcd.c
index 6576515a29cd..34524505bdef 100644
--- a/drivers/usb/host/r8a66597-hcd.c
+++ b/drivers/usb/host/r8a66597-hcd.c
@@ -759,7 +759,7 @@ static void enable_r8a66597_pipe_dma(struct r8a66597 *r8a66597,
 	struct r8a66597_pipe_info *info = &pipe->info;
 	unsigned short mbw = mbw_value(r8a66597);
 
-	/* pipe dma is only for external controlles */
+	/* pipe dma is only for external controllers */
 	if (r8a66597->pdata->on_chip)
 		return;
 
diff --git a/drivers/usb/host/xhci-hub.c b/drivers/usb/host/xhci-hub.c
index d27c30ac17fd..7bae67ddf29f 100644
--- a/drivers/usb/host/xhci-hub.c
+++ b/drivers/usb/host/xhci-hub.c
@@ -946,9 +946,9 @@ static int xhci_handle_usb2_port_link_resume(struct xhci_port *port,
 	}
 	/* did port event handler already start resume timing? */
 	if (!port->resume_timestamp) {
-		/* If not, maybe we are in a host initated resume? */
+		/* If not, maybe we are in a host initiated resume? */
 		if (test_bit(wIndex, &bus_state->resuming_ports)) {
-			/* Host initated resume doesn't time the resume
+			/* Host initiated resume doesn't time the resume
 			 * signalling using resume_done[].
 			 * It manually sets RESUME state, sleeps 20ms
 			 * and sets U0 state. This should probably be
@@ -1924,7 +1924,7 @@ int xhci_bus_resume(struct usb_hcd *hcd)
 				/* resume already initiated */
 				break;
 			default:
-				/* not in a resumeable state, ignore it */
+				/* not in a resumable state, ignore it */
 				clear_bit(port_index,
 					  &bus_state->bus_suspended);
 				break;
diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
index 4d664ba53fe9..b2950c35c740 100644
--- a/drivers/usb/host/xhci-ring.c
+++ b/drivers/usb/host/xhci-ring.c
@@ -426,7 +426,7 @@ static void xhci_handle_stopped_cmd_ring(struct xhci_hcd *xhci,
 	}
 }
 
-/* Must be called with xhci->lock held, releases and aquires lock back */
+/* Must be called with xhci->lock held, releases and acquires lock back */
 static int xhci_abort_cmd_ring(struct xhci_hcd *xhci, unsigned long flags)
 {
 	struct xhci_segment *new_seg	= xhci->cmd_ring->deq_seg;
@@ -799,7 +799,7 @@ static void xhci_unmap_td_bounce_buffer(struct xhci_hcd *xhci,
 
 	dma_unmap_single(dev, seg->bounce_dma, ring->bounce_buf_len,
 			 DMA_FROM_DEVICE);
-	/* for in tranfers we need to copy the data from bounce to sg */
+	/* for in transfers we need to copy the data from bounce to sg */
 	if (urb->num_sgs) {
 		len = sg_pcopy_from_buffer(urb->sg, urb->num_sgs, seg->bounce_buf,
 					   seg->bounce_len, seg->bounce_offs);
@@ -2442,7 +2442,7 @@ static int process_isoc_td(struct xhci_hcd *xhci, struct xhci_virt_ep *ep,
 		sum_trbs_for_length = true;
 		break;
 	case COMP_STOPPED_SHORT_PACKET:
-		/* field normally containing residue now contains tranferred */
+		/* field normally containing residue now contains transferred */
 		frame->status = short_framestatus;
 		requested = remaining;
 		break;
-- 
2.34.1



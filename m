Return-Path: <linux-omap+bounces-3753-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 652F0ACD972
	for <lists+linux-omap@lfdr.de>; Wed,  4 Jun 2025 10:17:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 34C343A404E
	for <lists+linux-omap@lfdr.de>; Wed,  4 Jun 2025 08:17:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B32C4239561;
	Wed,  4 Jun 2025 08:17:40 +0000 (UTC)
X-Original-To: linux-omap@vger.kernel.org
Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82C7621885A
	for <linux-omap@vger.kernel.org>; Wed,  4 Jun 2025 08:17:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749025060; cv=none; b=l0HlolKUH1a+ZQ7L8PWAPqECtbuSbIJX6Eex1ht3icKLOO6ZT+Nb3wZVcZgbM8EovgE8nzg3MKdk3aLcHKulPEqvoKllnaNaVOyxGOv6e+7J4BRGCTrs2gSV6UXxw7z0g975BRXK/cDNyH8u3yh99Eg2Yn9+2d3XC7OAqpuaBZw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749025060; c=relaxed/simple;
	bh=hXdSos481CTw+/k/IBZnk+bdnB8LDWzKLwWRXtYY7OU=;
	h=From:To:Subject:Date:Message-Id:MIME-Version; b=UWrO7joic4MvxHYC/y/JkFemzG5eHMiBea8O6PwcbjzPtE29qcmrwmnnxTHhONhRZH2uQEmn+s8Q3u3kSG8N1vx9HAui+9gxqXPq3E5q3hmyk51Y7Gd1Oc5bzb+wocDVPlFqDUslBECZFJoX/DqT1gIHWmg6g0IQwGW3C+gpjAY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 5b70245c411c11f0b29709d653e92f7d-20250604
X-CTIC-Tags:
	HR_CTE_8B, HR_CTT_MISS, HR_DATE_H, HR_DATE_WKD, HR_DATE_ZONE
	HR_FROM_DIGIT_LEN, HR_FROM_NAME, HR_SJ_LANG, HR_SJ_LEN, HR_SJ_LETTER
	HR_SJ_NOR_SYM, HR_SJ_PHRASE, HR_SJ_PHRASE_LEN, HR_SJ_WS, HR_TO_COUNT
	HR_TO_DOMAIN_COUNT, HR_TO_NO_NAME, IP_TRUSTED, SRC_TRUSTED, DN_TRUSTED
	SA_EXISTED, SN_EXISTED, SPF_NOPASS, DKIM_NOPASS, DMARC_NOPASS
	CIE_BAD, CIE_GOOD_SPF, GTI_FG_BS, GTI_RG_INFO, GTI_C_BU
	AMN_T1, AMN_GOOD, AMN_C_TI, AMN_C_BU
X-CID-CACHE: Type:Local,Time:202506041609+08,HitQuantity:1
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.45,REQID:a9ba98bb-c256-499e-b08d-11ffc3ace74c,IP:0,U
	RL:0,TC:0,Content:-5,EDM:-25,RT:0,SF:-5,FILE:0,BULK:0,RULE:Release_Ham,ACT
	ION:release,TS:-35
X-CID-INFO: VERSION:1.1.45,REQID:a9ba98bb-c256-499e-b08d-11ffc3ace74c,IP:0,URL
	:0,TC:0,Content:-5,EDM:-25,RT:0,SF:-5,FILE:0,BULK:0,RULE:EDM_GE969F26,ACTI
	ON:release,TS:-35
X-CID-META: VersionHash:6493067,CLOUDID:d2da5bbf20c230ad48ffe0e4d25e35d6,BulkI
	D:250604160908YEXTITYH,BulkQuantity:0,Recheck:0,SF:17|19|38|66|78|102,TC:n
	il,Content:0|50,EDM:1,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil
	,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_FAS,TF_CID_SPAM_FSD
X-UUID: 5b70245c411c11f0b29709d653e92f7d-20250604
X-User: lijun01@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <lijun01@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 755516702; Wed, 04 Jun 2025 16:17:29 +0800
From: Li Jun <lijun01@kylinos.cn>
To: aaro.koskinen@iki.fi,
	andreas@kemnade.info,
	khilman@baylibre.com,
	rogerq@kernel.org,
	tony@atomide.com,
	lijun01@kylinos.cn,
	linux-omap@vger.kernel.org
Subject: [PATCH] bus: del unnecessary init var
Date: Wed,  4 Jun 2025 16:17:12 +0800
Message-Id: <20250604081712.119523-1-lijun01@kylinos.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The compiler generates initialization instructions,
which consume additional CPU cycles. the
sysc_clockdomain_init should assign a value
to 'error' before it is read.so the var don't need init
to 0.

Signed-off-by: Li Jun <lijun01@kylinos.cn>
---
 drivers/bus/ti-sysc.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/bus/ti-sysc.c b/drivers/bus/ti-sysc.c
index 9f624e5da991..5566ad11399e 100644
--- a/drivers/bus/ti-sysc.c
+++ b/drivers/bus/ti-sysc.c
@@ -2170,9 +2170,8 @@ static int sysc_reset(struct sysc *ddata)
 static int sysc_init_module(struct sysc *ddata)
 {
 	bool rstctrl_deasserted = false;
-	int error = 0;
+	int error = sysc_clockdomain_init(ddata);
 
-	error = sysc_clockdomain_init(ddata);
 	if (error)
 		return error;
 
-- 
2.25.1



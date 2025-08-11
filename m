Return-Path: <linux-omap+bounces-4178-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D41BB2093E
	for <lists+linux-omap@lfdr.de>; Mon, 11 Aug 2025 14:49:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 794CE4E32AA
	for <lists+linux-omap@lfdr.de>; Mon, 11 Aug 2025 12:49:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 310212DCF78;
	Mon, 11 Aug 2025 12:48:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="eep+4z0+"
X-Original-To: linux-omap@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6717A2DCF56
	for <linux-omap@vger.kernel.org>; Mon, 11 Aug 2025 12:48:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754916527; cv=none; b=YVgK9FbrjaWLGqWP3qw3iz/rn7xestj9wMHdqIlY6J7X3ZKDPyCp1TBweEVlRWa46UEOnKAePKbAaOjkpDax5jLaxrt68XPpzN/j/A7wQCKJSuOgbbXUaILCWj5AgSKA7N9qLnBT89MGDsRlel2XuF5FPfq33XvH+XcF3NbHTfQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754916527; c=relaxed/simple;
	bh=KZev2woXWU9HznU+gcnRnr0OtzfEyHcHVt06Cr6pNMU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MTH+2PM5pjL0J5SyAL9cOMqF6A835nzdmCDLMIIrQVTcOQIoBwaHAnEHmJYYE6KX2RMzxaHIx3BYXCCMliaahKtU5zUVNze2Kcs1qbrEd71ihpsG/v2W2Ilsl7r0iRMUmHuYAF+XRmTFvt00IfzdoaWZLiREmfBuTGLghl/ZHTo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=eep+4z0+; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1754916525;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kv4JIx5nA2wF0cDefvytjovFmfVgfiGYSd/ZtzOrYfk=;
	b=eep+4z0+5HMq29fw4gpLnIotngOBIOVL+idPb3SD2TqkOaW5cLORMrhH7uFmq/VVQxYmXB
	/0coOlIkSFTQ1kxkWGEoR7E86oUS7hYfd96MmISFbrQvTNu/GXqOWrHbtAY03bJ9WbACub
	Oc7Xl3VvqwoCOwTJEDKJPkJmtbHiqqA=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-619-9t6eAljSMoyLzXVmIWV0UA-1; Mon, 11 Aug 2025 08:48:43 -0400
X-MC-Unique: 9t6eAljSMoyLzXVmIWV0UA-1
X-Mimecast-MFC-AGG-ID: 9t6eAljSMoyLzXVmIWV0UA_1754916523
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4aedcff08fdso82159061cf.2
        for <linux-omap@vger.kernel.org>; Mon, 11 Aug 2025 05:48:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754916523; x=1755521323;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kv4JIx5nA2wF0cDefvytjovFmfVgfiGYSd/ZtzOrYfk=;
        b=g/QXBKJMs9NzV3dTN1azUyX25w7dGAEP4Jk5uByxLhFwCroRpnqYPyWDQExNfEpzSw
         KhZ4kKnK+HFURomxoDGPXC9GxjCRvgBXzrw1K2aWvzFW2LXdMCO8JIJSKEGpSFCcheGQ
         6O1kfO5WW1JNruPjcdy43U3iog300e7eY8IF5pf+7PGmxb7/eaRkIram+s5IFc3vxmfQ
         kq0HcoLWMI1GdqQBIoZq18aonYolfn7XwZ9CirSFJfjAOLX2nI6e9ap3+ZD1ixtRZPCg
         WnX3zkYZLakydcxH3es1TjoI+LC6FjeChCMFVmVKfQ94NVkwOj2/Dr7JKm3IrxpJYkPJ
         W4XQ==
X-Gm-Message-State: AOJu0YyYgXZeSxvh3YyFxrCEmYZ7vLoDMHnj+Kp/J++tmz1GiBWinOux
	hI+zgFWqPhuj27ebbwnJRakX6icrd7nYLqaZHapQgeGuxIuv0aDMCMl1yg67qwdyaYK9SJt15Za
	VM5NqEQ5Y15xZ91Z5SAq+ZK8hOjh2O2f729NS7SYrdrOxhh/lCb7wMhdcjUtGsCs=
X-Gm-Gg: ASbGncs+Uz2hHaXKAS2p1s+a3C/Y0p6vryOcCccEMDlAQSJEnCuSjN30p30iGiQapVk
	Z3LWOTc2o9XQ71ffZypX5ZJyyNs2NExZVaE2S5mChjyrKO2+4mcfV2T1tU06vYp397Kwm60oAf6
	C8QhuSQDT5T5/uxX2XG+vEOJOEl7C4TjJO7RZ99kmCDryWKiZr2H1zVvwKs2O2COicQF00f7k11
	rSLec3R9ieWRpn1uT3uxOzR6ct7GpHpXkg6rvdZKJ6kQFu2GRfUcYPK8hWLFBZTO6ADvDj/i4C6
	1KyhWko3h2W4fuQGHt92LbgoDCScAoLlwAaiSUuocO1wT03s0lwc+8DEq8Sk5oI6i7BhLTOKHd7
	g32o=
X-Received: by 2002:a05:622a:11d4:b0:4b0:70d2:5dae with SMTP id d75a77b69052e-4b0aedd7c6cmr184053671cf.32.1754916523240;
        Mon, 11 Aug 2025 05:48:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE/s9J1rhGKt71vKkorwhvcmkFojr3YuVPBRRrYFELwpV8zzT+UTulziPC71u8GjxQnYOpeGg==
X-Received: by 2002:a05:622a:11d4:b0:4b0:70d2:5dae with SMTP id d75a77b69052e-4b0aedd7c6cmr184053171cf.32.1754916522674;
        Mon, 11 Aug 2025 05:48:42 -0700 (PDT)
Received: from [192.168.1.15] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4aef746b6efsm138724001cf.15.2025.08.11.05.48.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Aug 2025 05:48:41 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Mon, 11 Aug 2025 08:48:10 -0400
Subject: [PATCH 5/7] clk: ti: divider: convert from round_rate() to
 determine_rate()
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250811-b4-clk-ti-round-rate-v1-5-cc0840594a49@redhat.com>
References: <20250811-b4-clk-ti-round-rate-v1-0-cc0840594a49@redhat.com>
In-Reply-To: <20250811-b4-clk-ti-round-rate-v1-0-cc0840594a49@redhat.com>
To: Tero Kristo <kristo@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Maxime Ripard <mripard@kernel.org>
Cc: linux-omap@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754916502; l=1648;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=KZev2woXWU9HznU+gcnRnr0OtzfEyHcHVt06Cr6pNMU=;
 b=9HtWsQuOhfM98X55HNWOck7M08AwApUYonHPDgwcZa8S/UhZwBGL/lFQadP95RXlxeEt3lQtd
 BZJ3vwA7z0fDwJ7YnZJoOWmOvTB+trUUgK5JvgAJBPVoJnuqf7KVZLm
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=

The round_rate() clk ops is deprecated, so migrate this driver from
round_rate() to determine_rate() using the Coccinelle semantic patch
on the cover letter of this series.

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/clk/ti/divider.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/clk/ti/divider.c b/drivers/clk/ti/divider.c
index ade99ab6cfa9b18e5bcfb616273b5c06637035c1..6f58a0f2e74aec14fd3711d722e66b6ecbaef104 100644
--- a/drivers/clk/ti/divider.c
+++ b/drivers/clk/ti/divider.c
@@ -223,13 +223,15 @@ static int ti_clk_divider_bestdiv(struct clk_hw *hw, unsigned long rate,
 	return bestdiv;
 }
 
-static long ti_clk_divider_round_rate(struct clk_hw *hw, unsigned long rate,
-				      unsigned long *prate)
+static int ti_clk_divider_determine_rate(struct clk_hw *hw,
+					 struct clk_rate_request *req)
 {
 	int div;
-	div = ti_clk_divider_bestdiv(hw, rate, prate);
+	div = ti_clk_divider_bestdiv(hw, req->rate, &req->best_parent_rate);
 
-	return DIV_ROUND_UP(*prate, div);
+	req->rate = DIV_ROUND_UP(req->best_parent_rate, div);
+
+	return 0;
 }
 
 static int ti_clk_divider_set_rate(struct clk_hw *hw, unsigned long rate,
@@ -299,7 +301,7 @@ static void clk_divider_restore_context(struct clk_hw *hw)
 
 const struct clk_ops ti_clk_divider_ops = {
 	.recalc_rate = ti_clk_divider_recalc_rate,
-	.round_rate = ti_clk_divider_round_rate,
+	.determine_rate = ti_clk_divider_determine_rate,
 	.set_rate = ti_clk_divider_set_rate,
 	.save_context = clk_divider_save_context,
 	.restore_context = clk_divider_restore_context,

-- 
2.50.1



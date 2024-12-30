Return-Path: <linux-omap+bounces-2923-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D39849FE2A5
	for <lists+linux-omap@lfdr.de>; Mon, 30 Dec 2024 06:29:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 29E053A19EF
	for <lists+linux-omap@lfdr.de>; Mon, 30 Dec 2024 05:29:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A33E316F288;
	Mon, 30 Dec 2024 05:29:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=ethancedwards.com header.i=@ethancedwards.com header.b="Zz+OiCX2"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-4018.proton.ch (mail-4018.proton.ch [185.70.40.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92D7D817;
	Mon, 30 Dec 2024 05:29:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.40.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735536553; cv=none; b=P5j+3FedHYdjJ6ToVnK22TAYqe9jLgKMzn4zlsSFLJfQpo/TJLBzhLufyVvIDPmacR9I2Hhf+B3zWX8ct3SMWblzb6St3Nsy7uGNs/EJS1Tz1zir642J8De26T7IfelVmPHfWSufKWxAHk/49J8V4SZ6GYpGIEKKIQBIM0MQwDs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735536553; c=relaxed/simple;
	bh=z1tbn6LI4vl+YBo18LDIWQRtOtRiBFMCb910mSXG7cw=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=dJ6889bJUWgE+3qrYl3kxKW10hs3p1UP+9ukzDAXN+J3Pa9U9jV/5wVqjEhoMya3YvQpa7rajKD7xTo95lEDcAHxs0GblfGQYYCsMmDZn7L5KytqVvUNL5D/yz7wom6zYynOX3Dwtn46Oev8FqZYqpzhTBSXb27n26OlEKt0CiU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ethancedwards.com; spf=pass smtp.mailfrom=ethancedwards.com; dkim=pass (2048-bit key) header.d=ethancedwards.com header.i=@ethancedwards.com header.b=Zz+OiCX2; arc=none smtp.client-ip=185.70.40.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ethancedwards.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ethancedwards.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ethancedwards.com;
	s=protonmail3; t=1735536542; x=1735795742;
	bh=z1tbn6LI4vl+YBo18LDIWQRtOtRiBFMCb910mSXG7cw=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector:
	 List-Unsubscribe:List-Unsubscribe-Post;
	b=Zz+OiCX2Xx5bWEmeK5nnR0zJicm4mDJY2qP8WXWcGEm4CJRfBzyhIk5nUpHMlrAiy
	 qACymolqPfeQ0oRmKFgNO83NaaKuLDi6eMm49luMd7Ox4WN3V97Rk7yuVqUHRQpWmu
	 qFb0V3RTJsYHfyKb2yN4J6APE/odc9bHOO5O9r1JVwIvQH7m2Dp0p3e6e/gSL49dQZ
	 qqgXjR0AB0Fg8UrxUnEBN+eYQ5gAtRPnI6ahDrEhIP7lJ22DASd65oZK7F7nCy00aV
	 sPYOx3QD+SphcicQgA1RTvrwznPwidKQWxc1ech84w/SmBarlzbETAxM8Ug5JDu8yQ
	 w2yS26kefmBZQ==
Date: Mon, 30 Dec 2024 05:28:58 +0000
To: kristo@kernel.org
From: Ethan Carter Edwards <ethan@ethancedwards.com>
Cc: mturquette@baylibre.com, sboyd@kernel.org, linux-omap@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org, kernel-hardening@lists.openwall.com
Subject: [PATCH] clk: ti: use kcalloc() instead of kzalloc()
Message-ID: <xfjn4wqrhukvi45dkgkbulamq3242eijn7567vxwaxznh4ebdr@waat7u3l2mhi>
Feedback-ID: 28410670:user:proton
X-Pm-Message-ID: b630a1367cff86984b54c694637490e109da7999
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Use 2-factor multiplication argument form kcalloc() instead
of kzalloc().

Link: https://github.com/KSPP/linux/issues/162

Signed-off-by: Ethan Carter Edwards <ethan@ethancedwards.com>
---
 drivers/clk/ti/mux.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/ti/mux.c b/drivers/clk/ti/mux.c
index 216d85d6aac6..f684fc306ecc 100644
--- a/drivers/clk/ti/mux.c
+++ b/drivers/clk/ti/mux.c
@@ -180,7 +180,7 @@ static void of_mux_clk_setup(struct device_node *node)
 =09=09pr_err("mux-clock %pOFn must have parents\n", node);
 =09=09return;
 =09}
-=09parent_names =3D kzalloc((sizeof(char *) * num_parents), GFP_KERNEL);
+=09parent_names =3D kcalloc(num_parents, sizeof(char *), GFP_KERNEL);
 =09if (!parent_names)
 =09=09goto cleanup;
=20
--=20
2.47.1



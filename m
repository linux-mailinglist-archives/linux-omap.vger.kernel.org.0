Return-Path: <linux-omap+bounces-2249-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A7E9E9866C6
	for <lists+linux-omap@lfdr.de>; Wed, 25 Sep 2024 21:22:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 51FBF1F2241B
	for <lists+linux-omap@lfdr.de>; Wed, 25 Sep 2024 19:22:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 04E8213DDDF;
	Wed, 25 Sep 2024 19:21:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="qgDo3kvg"
X-Original-To: linux-omap@vger.kernel.org
Received: from mout.web.de (mout.web.de [212.227.17.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8BD91D5AD8;
	Wed, 25 Sep 2024 19:21:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727292111; cv=none; b=DVBNr8R/X7zdjD1pqghxaEjlK8yh5/yB6WHrSYjxemseP1mZ68X0TtwJ6AcXvVIt4eKjBXDgSGQma78agoAXbJhfStvRyKt9RN99+m5LlAuJAGZSn99LODpFYixxzOgcpN7CBx4V9ryS4p2zdn8EPapQ/Jjo/i3vncpI8FAFbCo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727292111; c=relaxed/simple;
	bh=Ypreh1oxUP+JRwlej/SlPeKxbGQugv2lZ9JltWkx9Ag=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=C9RK+vemncy7RbtZ1zWRAfHpM+mtuMFoej+rDvfKuWIPBG+CQSrKnOYklbSeqseYWP8MvHOSFrkK8V7hqNop803uXzGfganACYTeL3LhfCZaN7zVqZ4C/p5cqFrExwkl77T17w59SM48FsrUulA8JaqGVwEU9zTV9Ds7ZbRYpIY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=qgDo3kvg; arc=none smtp.client-ip=212.227.17.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1727292088; x=1727896888; i=markus.elfring@web.de;
	bh=QHNX63lCaLZ/kXhP2texHGN8N85qJtveop2RVq8AI7I=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:From:
	 Subject:Content-Type:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=qgDo3kvgxd6JoorMWhogb5BWzn14bz66PiULQ01b4URQSEbd4A/EQMceGfhUq/gz
	 dA9wVhSme2wEIIjqkLY1t8hhkSqA7/8/FgdiBY4+aaBwasRHpjdCpbVKp6TDSeQHC
	 USjLmb5PXbNEshDnpjsNX17TM2B1sxIgNyhT/FsCUMnhh7pIiC+aI5SfNAnMi9ePp
	 HsE4VutlbI92BEa5/FkObcYtTmzIM6QKrt67TJFqBqagi6SYgD/ELKvFhzqcYAatV
	 1yNEyGUL8FG1502U7kMVZgxFBzdUneBR7QitVo9bzd/GCJKgrIkHoJwu5y0cfNCbd
	 /V2xBy18uDi+PW0GRg==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.84.95]) by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1Md6y1-1sLIt90JoR-00cwQb; Wed, 25
 Sep 2024 21:21:28 +0200
Message-ID: <f7a08897-94cb-4776-9aee-c6ca9fbfd750@web.de>
Date: Wed, 25 Sep 2024 21:21:24 +0200
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: linux-omap@vger.kernel.org, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Helge Deller <deller@gmx.de>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Dave Airlie <airlied@gmail.com>, Rob Clark <robdclark@gmail.com>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>
Content-Language: en-GB
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
From: Markus Elfring <Markus.Elfring@web.de>
Subject: [PATCH] fbdev: omapfb: Call of_node_put(ep) only once in
 omapdss_of_find_source_for_first_ep()
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:dzJ70/kJLcxL9FAxDYaOrZmzj704bHO3oone/Czyk1TwcQAw8Yl
 oU5ypyH2oM0z6egJVnks77aicbk15U6Mrt6MrR1rnoAY1B2ws3YLwzJ7+qMZmluVbXcYkZK
 u+EMvcyKRbHTUqgs1GO07oJXqn+/D/8w6GW9UUYMI7X1wstm2f8Ifc5onWxR7e34hBHb1II
 SM4ibtZlXo+JVpMaXgVhQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:IPFWIpla35Q=;WHNFDcpnYse4+Ze6/DwHcs21ita
 KL7TJqCB7pWQfnLD27cSG413OHCcI+I7yIDyqUKymq9CSi7aYTQD5sogqt3++A6tFwamHJiPs
 WIK8YXoELhPNJzfgUF7oi1igyZXGOy29PPdi9r7E1EJagU3ICcWwCRtDwhbc07GAj0uOD11XK
 1icmfXm/zlQ0Gt8Hqz417iMUyka6WQGZSo19H5vnBvnG5LeRECwKdIvUPAlAQ+Cuyr93WFnnE
 uXpDHSK+WxIElu/Q2op6UkpcR8xLzsuROcMI2bzh0JMQ3U7lQ2KPaU8qN8PuygPIORjGXa1ar
 xVgE+DQRHPeOdX0r5no1Qa//ziHWZrc0XVKy7f8d8KH3lAGtNA2kHb/zIx0VnIfnJToiiXFIa
 MHdlqHiC5pI/6JY9rAC0K12LxN18l6bC8a7xvn1CsiQsZvk1TKBItdiKhi5wc2Phfk4E+1wr6
 pLxxeEkwE01yDk/WlmKnt8yh3smn86KTQtQMh+qN796moVrU8bWn462K5/61Jf0mpGAHAD9i4
 KlvReM/2ZFOSiBg0sJq7KPDdy4wZy2tVMZg3NgdXmkt79GL2+ixpKo3TvVPgbf8Ql15cdNZ+J
 3wE1AE1//BE1o3ZN75ugCobH6b33V7a22jrlx9IboEyupLTB4521TrBUAS5Igj9aIJ92UxzG6
 1g8EkFs2puhV+EupIt+rSElC67HRDZoHaLW+8gpN5EtIjZB6SeL6yIFKAMICMtNfWXE0YInVr
 oGt1IFKaIej1GbXc1aPZDt+I8kmkTJhoo75Pr4OOxsXGc/nDs+78mGR6SG/kH9/YEs1d7D1bw
 oMLeNgCNdqtLsQ+b2jiTOe3Q==

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 25 Sep 2024 21:12:36 +0200

An of_node_put(ep) call was immediately used after a pointer check
for a of_graph_get_remote_port() call in this function implementation.
Thus call such a function only once instead directly before the check.

This issue was transformed by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
=2D--
 drivers/video/fbdev/omap2/omapfb/dss/dss-of.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/video/fbdev/omap2/omapfb/dss/dss-of.c b/drivers/video=
/fbdev/omap2/omapfb/dss/dss-of.c
index 4040e247e026..d5a43b3bf45e 100644
=2D-- a/drivers/video/fbdev/omap2/omapfb/dss/dss-of.c
+++ b/drivers/video/fbdev/omap2/omapfb/dss/dss-of.c
@@ -129,12 +129,9 @@ omapdss_of_find_source_for_first_ep(struct device_nod=
e *node)
 		return ERR_PTR(-EINVAL);

 	src_port =3D of_graph_get_remote_port(ep);
-	if (!src_port) {
-		of_node_put(ep);
-		return ERR_PTR(-EINVAL);
-	}
-
 	of_node_put(ep);
+	if (!src_port)
+		return ERR_PTR(-EINVAL);

 	src =3D omap_dss_find_output_by_port_node(src_port);

=2D-
2.46.1



Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B18CCF6048
	for <lists+linux-omap@lfdr.de>; Sat,  9 Nov 2019 17:38:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726125AbfKIQiD (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sat, 9 Nov 2019 11:38:03 -0500
Received: from mout.web.de ([212.227.17.12]:37049 "EHLO mout.web.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726112AbfKIQiD (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Sat, 9 Nov 2019 11:38:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
        s=dbaedf251592; t=1573317468;
        bh=NYwwdppIlIIgfof/iyxHHWRbLQIkF3lgRlel5bM1XOE=;
        h=X-UI-Sender-Class:To:From:Subject:Cc:Date;
        b=cn/HAfFSac0GeWORCdEw98y0CwFCgCyRYLL0aXsd5GuITRHNsLMSifoysT6JNQRFy
         IAhnHAcyaFj2/wkpVyoMTt2RJabhUeC5//N+yuluJ5G1EbfQr7xaocU2YulQ5ApcAT
         mUNFCIeSv5IroTcTfiNv1YfJxTBxRNaFwwU84xAM=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.2] ([2.243.82.67]) by smtp.web.de (mrweb103
 [213.165.67.124]) with ESMTPSA (Nemesis) id 0LxfGh-1hrZTj1SIt-017Czy; Sat, 09
 Nov 2019 17:37:48 +0100
To:     linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Russell King <linux@armlinux.org.uk>,
        Sebastian Reichel <sebastian.reichel@collabora.com>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Tony Lindgren <tony@atomide.com>
From:   Markus Elfring <Markus.Elfring@web.de>
Subject: [PATCH] ARM: OMAP2+: Add missing put_device() call in
 omapdss_init_of()
Autocrypt: addr=Markus.Elfring@web.de; prefer-encrypt=mutual; keydata=
 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 FEE=
Cc:     LKML <linux-kernel@vger.kernel.org>,
        kernel-janitors@vger.kernel.org
Message-ID: <112eb5b9-bca7-41ca-efc9-1104b6063f75@web.de>
Date:   Sat, 9 Nov 2019 17:37:45 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:+01KfvO0orns3QXKIpAhLAiSxkmbajyqMTrqiYYVqYvtnQrv61W
 fglI0HxToa1W4K2cqvnpNCJv5TrZmXJ5q83J411V86igSy/t9HiuIrmHig4jEzsgaCKj/tO
 p5zY4HhJWvwcR008s4E9Z4nBeuhimb1h7DxZOYzidLu7DbK2jjoT4CNyA9HgJ9nqi29dyqI
 Tw4mibhKt4/GJz/WMGRuA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:j078fx435K0=:YE6gmmoF8el4HdE/bFU1yQ
 rBjrE67Fp6QqW83D5YP8pr9PWHWPD/BL1kzBYeJNlS8/eSwiD/bGY7zxprE2gDENGc7ouimGk
 aeLze54DdpwbNgZ9W0VBq7qVvrM8c/o9mtC4LEZGZTY/PX4h22UnakCMfUK40gix0X7SwJ07s
 pZO0GlE0Ph5IUMg1wD87SSnzSDvfFaMsAU3IZaPlmS2fYz+hfNGlQpNhE0CR8yPzXzFFWfJRd
 958tm9DNxBy532PfMWhaJfWvu7hlAXdBH15xIW1QfsMz7OZfI4ZjUylNnbekKhvqXzvaTxbBm
 NnT75HqFm/dVGQmJUYCJ1MUnxIA4d9Vk+tY3upY3YD3hryJOJJgX5Tx2JKrQEp5F8w9PsrkyI
 lusOPj3Hpq0CorMXM07zOrcg5F2f3bhXPil4+fKTs9d+viFG0gObPIShYa9/vYjwwJFXLmZ8X
 DvMfPJOS2HRoCL282NsMkKAGBJYAamP2xCiYxG1KNCoO2DQp54HIC1JcZ32rLIo8X+3QrL+5o
 xMmjQA0nKSih0tSYXIw3KzQ8RjEKygKs9pL+mPpEDqBTqIz6hCPEs6EJg44DV2dGITPRqGXne
 TQNpT+A/UFdDJRcESXk6/7sVZbaZmBlYO+OU+dX83SCZduzSkAkRQ2Rvg5gFSYipu2Cf7vwLS
 ysjtBGjeKj6a5+jxONPWZadTV29FmHQ1ekVXrS7pOG5AHdURlbdpZbimcQpm4SDup7/tg83pe
 RDwQ6Oj4Sod6PxvLKLfFXycpiZQhfjkcNgv3Xgt4j6SV+mdK7jzoxnWdNZMd33KeVgPQCHcO1
 vFuXUtLcEx8TsWCNy7U3Sh0rXvT10V97T263fvRPvJstS9VXh42atyHh7v7c0EbQP/kHPoTIM
 nJLrtPPiYfOK9ODQLnX8iZvffLpUKHCTudim0Hp2jxExHyCHOcQ5CeN91XWsq8vyzOWdbLrUv
 2gqoVhC/a2b4ZxIMyZ/zyZzPVoMo432zy7+6bQkAAkUIpri+JO28+WSb+pjYIn/FxA800Vh7S
 CiUzT+H3iNXAzGwDtYCU4NzRyAqHRteXsTgh5SXzQtu+uUiMoZ2iCuunp9UImqRjYkmvB/syd
 CvyKzQZXLztX4ehoynV7MRZAJ2QmGLHzpEjfSAoa1s0lqaFYTIrwghBUcHltch9xm0HybQ+M1
 C67NzdBxT8oMimLRKiRvvDTOgvBE+HI7BE5VMEnOkrAoCwHBPMru7l2KEL8up1wc9g7IhVXHv
 GpZhosRGGNNi32vEOSqwYTaXWwYboTLOVkflSX6/Q8GcXRbZ/uFFBKGZ25gY=
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 9 Nov 2019 17:19:35 +0100

A coccicheck run provided information like the following.

arch/arm/mach-omap2/display.c:268:2-8: ERROR: missing put_device;
call of_find_device_by_node on line 258, but without a corresponding
object release within this function.

Generated by: scripts/coccinelle/free/put_device.cocci

Thus add the missed function call to fix the exception handling for
this function implementation.

Fixes: e0c827aca0730b51f38081aa4e8ecf0912aab55f ("drm/omap: Populate DSS c=
hildren in omapdss driver")
Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
=2D--
 arch/arm/mach-omap2/display.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/mach-omap2/display.c b/arch/arm/mach-omap2/display.c
index 439e143cad7b..46012ca812f4 100644
=2D-- a/arch/arm/mach-omap2/display.c
+++ b/arch/arm/mach-omap2/display.c
@@ -265,6 +265,7 @@ static int __init omapdss_init_of(void)
 	r =3D of_platform_populate(node, NULL, NULL, &pdev->dev);
 	if (r) {
 		pr_err("Unable to populate DSS submodule devices\n");
+		put_device(&pdev->dev);
 		return r;
 	}

=2D-
2.24.0


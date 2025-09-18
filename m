Return-Path: <linux-omap+bounces-4186-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 39AA8B220EF
	for <lists+linux-omap@lfdr.de>; Tue, 12 Aug 2025 10:31:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AAE7C3AB681
	for <lists+linux-omap@lfdr.de>; Tue, 12 Aug 2025 08:27:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 60F812E4279;
	Tue, 12 Aug 2025 08:27:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="JvHwgbIp"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 524BE2E2DE4
	for <linux-omap@vger.kernel.org>; Tue, 12 Aug 2025 08:27:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754987238; cv=none; b=mPXpvkST84CSJoPg1WmzQGr1Jci9HURzpJTDOK1oOxBJ+ZVcJDxbQ968eDqUPiIh4svGguS3MDkDSMvpkjTT+ZMkXZOu5BbGhS0WzuHpvqYgeNxBloTl+v3YiljNk5dCj7UTem8cmjxoJ87VGmpy29Nj3waGFOkpqTDqYk+CA7c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754987238; c=relaxed/simple;
	bh=OvaIv/8oZ/GDP7Kwgfe/BrZhUlXBkWHg/MZtBgoNz40=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RKxhh5SUdcbFHUew4AVG9MMgF+Zw1KQWvziREw4jWC9w5mBxygziHX7vuQQttGqkwY57TvRuid/F4zWne4CPF+wBsEw1rfQ+d7M5rvMUDYRnh25mqiwTuepy0qFVWQBFiSVydsaoO/d2yES1ulQ8L0w2yvYJ+ahAPlGh/hw372k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=JvHwgbIp; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-3b9141866dcso109377f8f.2
        for <linux-omap@vger.kernel.org>; Tue, 12 Aug 2025 01:27:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1754987233; x=1755592033; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DLMz5dhvl1HJGifQ8hfDJvvXhldeSDOtxBP6N+/lIpI=;
        b=JvHwgbIpX5iK8o31mtYhG9SevDLmtJqlPt0xEoSa75hXFcIklRk+cZzomfBmOhb1PP
         ILytaJrut1SfBzx4MXT9Bpof/rOb+QQwDCMGL1obkiRExXkrcuz9PCKnYrK2HQhrI9mH
         KPlOFJlO0r2e7UVVYdb9yRa/wx1WP7t+SumAi4nbwot3kNWu0lRniVKF/wPhZRc+KFg8
         GTF2nKKG0ZKailWU+5rVzOopmx84ATUbkbYYLFXVCsujTBa77JSYO6RNhPzfeaUGEtL/
         dL/NkjTWfEaiNaZxiBbL/Sa8DFPGRe3TEpjD++uCoKuXekV3wnDkjvSeubtWr3juaKR+
         Evww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754987233; x=1755592033;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DLMz5dhvl1HJGifQ8hfDJvvXhldeSDOtxBP6N+/lIpI=;
        b=bELmwNEC7tbIrxu8awb3+fQ9TWtMBL+qxZtUUPNkJcYUkE/2rSwRy3CPkPTkDIOTqS
         3M+rpa8J0i4ToK9NX/VOFLO9p4Ho56ygvbiF+9iDwvg+i1dmUMjq25+NCy1XVhtTHHtK
         h/dwskgnb1H2LVbhFJguLGvmBBWw9w2UE/egtVXoTHr6/Axwgd93tFF3PGD5UXSeL9Fv
         XtElYFwzT0tTBfD0H1kFLO1jTyj7rK+PEjGrrxm/UuCe5kDfZ41AfA3siNnnxKi5EPms
         foeGU+oWbeXiadMUwS6a8/4W2G4/jbEkDHE7p0eAFT/cxTUHxFshI+LiDA16rtm2dHy0
         +sKw==
X-Forwarded-Encrypted: i=1; AJvYcCXEiMSMGLqvxJ9J8ml/gRxsvUvmutfRYCITynyTsUytAwp4cRTHRyjhyWqvdSYIKwiY9r9owqKlaQB2@vger.kernel.org
X-Gm-Message-State: AOJu0YyA8T1IEsShXeeutp78bpkXGUrlNTBJIr+m/KElqjqHg1nlgTMr
	Di0BdIALXt+vYaHPHhf51hOwB9WoTvu56r4+hDQpYQ421TTIUcKmxkFX+kxCUdc5JcA=
X-Gm-Gg: ASbGncvMXXWuPSt1e26+aKa0ca6OKBjEEtAj+w9KDLNXryz2AZLdrNd4YCVORZUk5UR
	I3hf2Q9Xsc2Amt3uQmwK8yHAzlNoCVzudp8kdAROFwVXG+OYJPH3o0uBGFYzBM4zWP+p22G+ecQ
	DJ6T9pxfQq6MzbnyRfvdoHA/1YqS4jVhaUGCQfKHrgogWUaMkRTD2jFqxk5+uTrg7fbyKjAslIt
	LTNim9Fn9Asi+TMr03tMBuLgUjd0P7kW5dZyw/V0ChzrhGA8WRCF/tPhN4gncPEaY9ZKmgkdzmG
	+2Y+b9JH/1bLAYrdC3R3u1hcu6YhwtiR+3Ml0up2jAX45fQhk9P1Ed80/OZFwYvzFFdIu1y80f3
	6KZfaJrIg50/XgyA=
X-Google-Smtp-Source: AGHT+IHxf1Gheje5mkFJXNbYPspDezEy1ZvwMcDlFzSmLC9pvu7f4uHAGhCZoZHeWbKRH8nD1ty+QA==
X-Received: by 2002:a05:6000:22c2:b0:3b8:d893:5230 with SMTP id ffacd0b85a97d-3b91100ef7amr2091026f8f.47.1754987233320;
        Tue, 12 Aug 2025 01:27:13 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:16c8:50:27fe:4d94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b79c3b9386sm43549423f8f.18.2025.08.12.01.27.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Aug 2025 01:27:12 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 12 Aug 2025 10:27:02 +0200
Subject: [PATCH v4 03/15] pinctrl: airoha: replace struct function_desc
 with struct pinfunction
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250812-pinctrl-gpio-pinfuncs-v4-3-bb3906c55e64@linaro.org>
References: <20250812-pinctrl-gpio-pinfuncs-v4-0-bb3906c55e64@linaro.org>
In-Reply-To: <20250812-pinctrl-gpio-pinfuncs-v4-0-bb3906c55e64@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Alexey Klimov <alexey.klimov@linaro.org>, 
 Lorenzo Bianconi <lorenzo@kernel.org>, Sean Wang <sean.wang@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Paul Cercueil <paul@crapouillou.net>, Kees Cook <kees@kernel.org>, 
 Andy Shevchenko <andy@kernel.org>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 David Hildenbrand <david@redhat.com>, 
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
 Vlastimil Babka <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>, 
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
 Dong Aisheng <aisheng.dong@nxp.com>, Fabio Estevam <festevam@gmail.com>, 
 Shawn Guo <shawnguo@kernel.org>, Jacky Bai <ping.bai@nxp.com>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 NXP S32 Linux Team <s32@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Tony Lindgren <tony@atomide.com>, 
 Haojian Zhuang <haojian.zhuang@linaro.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org, 
 linux-hardening@vger.kernel.org, linux-mm@kvack.org, imx@lists.linux.dev, 
 linux-omap@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2037;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=8m+uO2wFoz45np2OTah2daZeJ2sZYqJ85l0WVEHKDas=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBomvrX9RRoKDbA/ltwtuJ4EyG2WO60DQb8Pb1vS
 coNAXS4U0iJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaJr61wAKCRARpy6gFHHX
 cg6XEAC8rNYcNrLRmViE7ypL62cxemJNiwcylZUk/EbB2LmSFdtxh5OdHOiPKfnWYC2WoqdsLeE
 dH7HsjwJepgfYk1itBu8siO7U3geQZasJ159uTbiAa9YW6PHmUFNLgxnltfj37gLl6FVIOgFscW
 mUASI9HQ5leJNQixSLwfniGqS39RegE+Z7Bf85pFZsDV6WOJINocubMK3rhzQecaeIKy+/YhWa6
 VuPszRdtOp16D8969UfaKprxgn5khsdU635KHvTI+cvzk9e+6La7xoXXGoRhTc0TBKf+Ig+hm07
 GPeEeW9mi+drhU3gfbjLHSY0SmdXerDgW9+3wPuV/BgVkVxDtYFYA2jznaWzg/wpFE/WUB8XKi4
 G2aLL8E+K2i512j9KQKBZU6YA6neVMBqab2iwlDJAK+IxaTqeDUx6e+X1cVnsbHv3rrnRLaWCwq
 eLi0qlNEU72l4DXrBAj+KdwVRQlEJ6WOTi+9VzcGlzb1VXu9bSzPS3A9H8hLGs9CZ9dDFjroEPF
 yOavvyND8j+CsN0tdDP9o0bTzuzZFXnJRJJgGXE7W27j9qIsrdDcyec13EvXbDNpFueJ6ERKv40
 g6XWI9ymS8TjdvJf5M6VlxYn8IqVcpF7TYMtLPDn5GPcl+DJqqJAcSFzv6pevX+qiAnP94PLErN
 ARW881PRppyAVwg==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

struct function_desc is a wrapper around struct pinfunction with an
additional void *data pointer. This driver doesn't use the data pointer.
We're also working towards reducing the usage of struct function_desc in
pinctrl drivers - they should only be created by pinmux core and
accessed by drivers using pinmux_generic_get_function(). Replace the
struct function_desc objects in this driver with smaller struct
pinfunction instances.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/pinctrl/mediatek/pinctrl-airoha.c | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/drivers/pinctrl/mediatek/pinctrl-airoha.c b/drivers/pinctrl/mediatek/pinctrl-airoha.c
index 5f1ec9e0de213d587b68f41d3458cf504ee1b21f..51cd0cdc2f5170d024fe984ce8882ed9b3ce6563 100644
--- a/drivers/pinctrl/mediatek/pinctrl-airoha.c
+++ b/drivers/pinctrl/mediatek/pinctrl-airoha.c
@@ -36,11 +36,9 @@
 #define PINCTRL_FUNC_DESC(id)						\
 	{								\
 		.desc = {						\
-			.func = {					\
-				.name = #id,				\
-				.groups = id##_groups,			\
-				.ngroups = ARRAY_SIZE(id##_groups),	\
-			}						\
+			.name = #id,					\
+			.groups = id##_groups,				\
+			.ngroups = ARRAY_SIZE(id##_groups),		\
 		},							\
 		.groups = id##_func_group,				\
 		.group_size = ARRAY_SIZE(id##_func_group),		\
@@ -334,7 +332,7 @@ struct airoha_pinctrl_func_group {
 };
 
 struct airoha_pinctrl_func {
-	const struct function_desc desc;
+	const struct pinfunction desc;
 	const struct airoha_pinctrl_func_group *groups;
 	u8 group_size;
 };
@@ -2908,11 +2906,11 @@ static int airoha_pinctrl_probe(struct platform_device *pdev)
 
 		func = &airoha_pinctrl_funcs[i];
 		err = pinmux_generic_add_pinfunction(pinctrl->ctrl,
-						     &func->desc.func,
+						     &func->desc,
 						     (void *)func);
 		if (err < 0) {
 			dev_err(dev, "Failed to register function %s\n",
-				func->desc.func.name);
+				func->desc.name);
 			return err;
 		}
 	}

-- 
2.48.1



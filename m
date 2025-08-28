Return-Path: <linux-omap+bounces-4388-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C999EB3A57A
	for <lists+linux-omap@lfdr.de>; Thu, 28 Aug 2025 18:04:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C2AA84634EA
	for <lists+linux-omap@lfdr.de>; Thu, 28 Aug 2025 16:03:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F108C275B18;
	Thu, 28 Aug 2025 16:00:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="AU5hN81w"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F3D227E1D5
	for <linux-omap@vger.kernel.org>; Thu, 28 Aug 2025 16:00:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756396847; cv=none; b=ljR07BO3OU6/kojDCbQ+sesijZnPlrdLm8Wt4osgqGBZLQMr1FaBEsElT/dZREXOje6ZnoVKJIVJfzsRICVVk6aiE4UlJT9PWP7lggujv2AGJ1nU72nQVU9tvr72FHX6fUJsraMd5CRz2OIZUjj4wfE0ly2TIH79hvLbDKnAtAU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756396847; c=relaxed/simple;
	bh=d+pkakvHisIo5B7fnb5foS5HS7QjQMAp1P2iWKiGNdo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hKcfnoWeCKnelCn9gdDXw75gIzzFi24UUGhNrhwUJpHntFmr1LzgYLlY1K1MPc8GuIR2re531utRC5bScn3z0AwfpftmHg3rFf9Tz7oGgV72/ox2PXmoPEijUalLjsopSeFKGUJkLYHOd7ltdCGbfMsjV4SYyFv73OZD7ObAzPk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=AU5hN81w; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-45a1b05ac1eso6097045e9.1
        for <linux-omap@vger.kernel.org>; Thu, 28 Aug 2025 09:00:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1756396841; x=1757001641; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JThKrLTPuFVwzCwJhKd4fJmIEtCxHnGrNzSYzGU4KrU=;
        b=AU5hN81wTdXdxf/m98TZmix/+zuSq4O9sP9pQ93nWv+m6qkRNO7GVDupuLjkNHqYdP
         ctFbUMjFzk6GStk9VLV/3NtKkNUm9Ljd2nMSnfKNU+KuYV54CWtQNLi14NAx3+67njPY
         n2Gde7d/7uUZaD3C46BrRqsc/V9krbyWzJfWPQhEkKMrhkT1zMOQ1SM5ZzZ2yMczOAGj
         P230KpYf2Mxdi0mRZ8F0GkVZ19tieS1plxYg7h0u7YUyj2vRu6seu7cRHaEDGf2Yk9ym
         F5CHFWJ42i1F0IxaNnq5kO0maCzFLbE3sEBgl4krnP4vRKH/NMZ7Ahm+TlGTWcJuxnr+
         U3FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756396841; x=1757001641;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JThKrLTPuFVwzCwJhKd4fJmIEtCxHnGrNzSYzGU4KrU=;
        b=SGmIO1U+Wx133wQ5LuLqL/30QAX2EUSMAkm2O0eD3YiVsAL5rAodnki6oIstfpntQj
         biK/iZTUDWtVygzU0duJ26Vz5US2VA4u+WpcescdD/iNSxTC0dgVEGR9o/o23ae0/B7T
         R9cy71erEDe2OVsbbmXDi8T9/mR7FMSrV87tgVBfbsloFY5bY+EsXjQAxuGpmTvtUfUE
         ykK2oH+DbIKvi01irVuEpXpphDyy+eU4HD6C6Ewkmw7lBfIKwLCYqWH5f4qZJaloqBFo
         SLuvjSOPM07a8ypd9g0K2fZB2nXWCKUhT2TIAUdV5q6MpDWvJ/xTQFWBU76l4wCZ4HH8
         NmJA==
X-Forwarded-Encrypted: i=1; AJvYcCWdftseVgHxbLUnvrBauqW6aZgNpHU57yUaQ6ti7h6o64duQz/wYluvDEv8Xmgkc1piuQnBHxadaePv@vger.kernel.org
X-Gm-Message-State: AOJu0YyssBy0OxdR28q4Lh2HpPtIvLJHYA5uWRJyaeS7npuhnGwClfqA
	0jVBTDaH4tixtCHNw+ADP7OlquvKRFsY3j24ixxjFDyMZoV3lD88ud3jvW7OrMnfZTw=
X-Gm-Gg: ASbGncteRLORtr3PYrAEkPQLz/aWfho/5RoCp4zrhMOE44pMDmFJ1f+D479JnBcsXMR
	TpoVgld3NJteo1Y8CHQpEAoUEz9vgHgB+T073qpszV9U3pPU6TW/V59qw7keSKev63wLQ6x+ByT
	GLxTO+selOX5C9gtNJpyGMNcxz3ScxwI5joZURV2b6yfRZyaCjaszXmAZ8gmuTiO1S/SpVlOsEQ
	Lasp3kQwYs6YNIFDQu3Dq3nBxpPGLWzSKuPDBVx1+WbJLFmLoaIQ8tTAjnPNWvsf1oLwfM9t348
	/DE8LQU5qeLpwEgf0uUeO8As1PVfZOsmqMPAmrS8CDc+Rn4kIcc80lPpAMMZVhB8o7gDnvOz9ar
	Sp66dCsPAuvaJSouhEg==
X-Google-Smtp-Source: AGHT+IGBclbNO8WGRtJ0uIJ0ka2pGvDxULNrTlJVFv33q7V9H1vL8p1aMqaTfJLA+km5WeyuNutw9Q==
X-Received: by 2002:a05:600c:548d:b0:45b:6f48:9deb with SMTP id 5b1f17b1804b1-45b75858134mr40479305e9.28.1756396841346;
        Thu, 28 Aug 2025 09:00:41 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:4933:4d7c:cf69:9502])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b6f0c6fe5sm80211675e9.5.2025.08.28.09.00.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Aug 2025 09:00:40 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 28 Aug 2025 18:00:21 +0200
Subject: [PATCH v6 13/15] pinctrl: qcom: add infrastructure for marking pin
 functions as GPIOs
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250828-pinctrl-gpio-pinfuncs-v6-13-c9abb6bdb689@linaro.org>
References: <20250828-pinctrl-gpio-pinfuncs-v6-0-c9abb6bdb689@linaro.org>
In-Reply-To: <20250828-pinctrl-gpio-pinfuncs-v6-0-c9abb6bdb689@linaro.org>
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
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Mark Brown <broonie@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org, 
 linux-hardening@vger.kernel.org, linux-mm@kvack.org, imx@lists.linux.dev, 
 linux-omap@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1755;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=1TtCXH0c1SnNyHC+v6gZsytFHMfkLN/q6H3Fm9nBNlI=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBosH0PIg19tb8c/EzOw0dn2/vV0Q2+khf5QKTgm
 oMVFo9hzQuJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaLB9DwAKCRARpy6gFHHX
 cmqpEACqff+3ib93FI87PuYM4exeofWP28ytmolqFv/JNDSfQlXfjFmYnRfKPTFyBA76ttfOjLm
 ASMPBrH6jm+gDbBK71pqHYmPLR2F3+VbGeBrBP4P+U4KIOoMivjWw3M4zYZw2pqshTxIuzIk8hp
 p7MU2ac3Y9n23iveKbzSAK+EoAmSxL2lQ15yc/7o8ph4+/jCy3aXmdAepBlD2zhWYVn/xEtcAcp
 XMTxIoIzyILFd7r5Z0RbiaGuyI1mT29BWNgpFIRDw954gCvFOYWUrbn2o/Lkg+Qctpz2A4FUeXI
 Diiu3zoutBbFXtO89+FSOyzdmqfSLbrt7rVfKtvvSp1/OoGcglsdJ9T5oWoGjckBb4Zc0Sbj1+U
 /4oXbRes08VCGwU5d0qXt2c2lxgrVlVnKODYUiEPU9qJkPSIX7Q9PAUOzdF6wmMNQBs3xWUDxDv
 PydivI+3iUC103HTAmcWHpervRU6SelZmt3njPpmXzohKb9EzGDwrif+F+FXALOTHaZUARsDhtf
 HPf1uVDdCvVnnIPhwwMrx5l+4F1B21FUAmCe4o6k2r6BZp5mZGL2FBpb+ZIiABfcTzIwxLGjOvn
 04jBAAR9bb5jV1pFoCEljbH/f0c2ullfdb+vvcTGt2JrOg45VcIDDclxo+6Iw2aCGRgUNKNCbPg
 KlIxSfNF/oUQW7Q==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Add a helper macro that wraps PINCTRL_GPIO_PINFUNCTION() for pinctrl-msm
pin functions and assign the .function_is_gpio() callback in pinmux_ops.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/pinctrl/qcom/pinctrl-msm.c | 1 +
 drivers/pinctrl/qcom/pinctrl-msm.h | 5 +++++
 2 files changed, 6 insertions(+)

diff --git a/drivers/pinctrl/qcom/pinctrl-msm.c b/drivers/pinctrl/qcom/pinctrl-msm.c
index 96e40c2342bdedb8857629e503897f171a80e579..a5f69464827119dfe2a7781b558094b283fca215 100644
--- a/drivers/pinctrl/qcom/pinctrl-msm.c
+++ b/drivers/pinctrl/qcom/pinctrl-msm.c
@@ -265,6 +265,7 @@ static const struct pinmux_ops msm_pinmux_ops = {
 	.get_functions_count	= pinmux_generic_get_function_count,
 	.get_function_name	= pinmux_generic_get_function_name,
 	.get_function_groups	= pinmux_generic_get_function_groups,
+	.function_is_gpio	= pinmux_generic_function_is_gpio,
 	.gpio_request_enable	= msm_pinmux_request_gpio,
 	.set_mux		= msm_pinmux_set_mux,
 };
diff --git a/drivers/pinctrl/qcom/pinctrl-msm.h b/drivers/pinctrl/qcom/pinctrl-msm.h
index d7dc0947bb161868c8f433dc2536719b8afc8bd8..4625fa5320a95a4d24e3a0c98a249e4f163dd4c7 100644
--- a/drivers/pinctrl/qcom/pinctrl-msm.h
+++ b/drivers/pinctrl/qcom/pinctrl-msm.h
@@ -29,6 +29,11 @@ struct pinctrl_pin_desc;
 					fname##_groups,		\
 					ARRAY_SIZE(fname##_groups))
 
+#define MSM_GPIO_PIN_FUNCTION(fname)				\
+	[msm_mux_##fname] = PINCTRL_GPIO_PINFUNCTION(#fname,	\
+					fname##_groups,		\
+					ARRAY_SIZE(fname##_groups))
+
 #define QCA_PIN_FUNCTION(fname)					\
 	[qca_mux_##fname] = PINCTRL_PINFUNCTION(#fname,		\
 					fname##_groups,		\

-- 
2.48.1



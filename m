Return-Path: <linux-omap+bounces-4196-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 26162B22125
	for <lists+linux-omap@lfdr.de>; Tue, 12 Aug 2025 10:34:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9044E16E80C
	for <lists+linux-omap@lfdr.de>; Tue, 12 Aug 2025 08:30:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6626F2E3384;
	Tue, 12 Aug 2025 08:27:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="oeKCm8Bs"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5D7C2E425B
	for <linux-omap@vger.kernel.org>; Tue, 12 Aug 2025 08:27:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754987255; cv=none; b=EcgyPSECANcFsJ0qkl4fxRssVzE1uIegxf2/nLHF8rz5dpvYC9h0C1Ov40JAMv7L4fz3jErK1tY9TPra1ZZsfafAzcYG1tUqUfovexZkNV/devvgrIG0YRQpFs+RzKR21mu8v0h1bXvhgFjKO/A+03CdP4y3JlTppvadn9DOEYU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754987255; c=relaxed/simple;
	bh=d+pkakvHisIo5B7fnb5foS5HS7QjQMAp1P2iWKiGNdo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kiVnvOIxGzJHU/vOS5mP72WQLKallWzu6rTSIuwWdchaF2gPcL9ZwoavCxIiOmkesSSmRgtwt719QtKz9l4OWySRnC4xu9kaW7RH8/YAr69L9kCWrGw4s6eCiUpPFEp669/IR0Lus+FR7Tfqcm8Fjk92SsLK++PEU1f3OnqUGg4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=oeKCm8Bs; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-459e7ea3ebeso19554765e9.0
        for <linux-omap@vger.kernel.org>; Tue, 12 Aug 2025 01:27:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1754987250; x=1755592050; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JThKrLTPuFVwzCwJhKd4fJmIEtCxHnGrNzSYzGU4KrU=;
        b=oeKCm8BsdOQl4noenc9fnWUoAMXYBMRMyGzcnG/qcUpcOj3i7+9aR6xSrFPPKt0h0/
         /eiuWHqNjcMZz+czcoRMU+sHQsVEQ+niDFv3hCIgkmiNATLK+HITlmgb5X6ZDTxkklcr
         2YVKCMFmwnTN2eG5PJyx9NqQOOUJWL2P4IXYgiKYmoWHrqbBYeqPZY/svKcm7TxIHJFq
         kUg38mt7RQvBed5Nh43+2CTW+Ii2a+psZCBQmN1i1r/Adrq4SjEc5UoryXdt7erGS800
         vToDoGAoRhUCJ2EF7VJrYfKXdZ2GxcK3pHAmt6Clm89DGvfVi/4RpmZTYpRboLUHyCgD
         udXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754987250; x=1755592050;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JThKrLTPuFVwzCwJhKd4fJmIEtCxHnGrNzSYzGU4KrU=;
        b=Apl+kZpXrmW9xKszXDedP+QRJBca00mWZj5L0sYrVVDl7opHigE/9/kpN4bwXDAlCp
         uvZcRnxtRkT77GM2/hWIyWYVteBP+1mmM29UyYG8wokBs7Z0EXCmsQ4/MTwMcXwbuW8x
         evsXiySvaY9ZEQrcZYOZGkdu3Z1D9f89XAPM13C0+BOcOOxIMXHjI6p1lEkYNyz6HDH8
         teMIohS+vqUaa1TIMKyh/Zpky5Wae7tX7zomBbUVJNGIxkPngXB8HAqmv3e75VpU1k8Q
         87Un8Cq+VsC9hKFclzFGGLJGkPYTgfcnpeamBuoULR6ZHAjaDL2QSaAahCjqqrNT7z+U
         W7aA==
X-Forwarded-Encrypted: i=1; AJvYcCW8/fXUEW1DIhaL59Hwm2iAayLIZau4/JWgwPDE4gYLciDUm/t6LjizVz8hyThdLtYplPGqRzlO1vbw@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3705sIaamuLuOe2THehfpQ/RAhyvb15A9mMC9pfuimGW1c+zy
	weXZVd5tn3cFf0k4X1PqMceIodsQMAaBYPAf/vUvvuzwWBg6OKkc7d7MA6Y9JRFO+Gs=
X-Gm-Gg: ASbGncsIMdOpMvVrQ8tSUJe/IrB0m1Zw4GwgPEckKFQK7Pg4rO871gXCgAqP5ck0F/w
	9UFWyivF1JRF33H1zaEocvF7qlWmFNinUQVVGrQWJaYWUGaVyvSLtUhtKao5lOTPgFt1xieCYTC
	/7C311ANvoofZA3vVW8GHARt3J1vIN3xa6qX4Ag9MZRV2IPSyCSdNCkyzuNQbih0JPPz+A7PeT2
	YlF93em4FXz550MQu4UXNtZ/GK90858uQ3LQ5s30ZC8+CFcn1X9XD4iKKJuGX6sL4WH4ORG2mOI
	s3tkzfogRVYwsE8gZ3fbeF9yVSoFrK430ciHXTijME5waqG2cMegZp6ethlznCZCLSSxpa1weTW
	7cQoS87z/yBu95Ts=
X-Google-Smtp-Source: AGHT+IFshlOvFK729Q2HiNSttBuhYGO5t1MHAK8R1Tl8WnDbe/OVg6KL0Aon7hXzH1skJVAbXFREsA==
X-Received: by 2002:a5d:64ce:0:b0:3b7:8473:31bd with SMTP id ffacd0b85a97d-3b910f9ab5emr2145237f8f.0.1754987250520;
        Tue, 12 Aug 2025 01:27:30 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:16c8:50:27fe:4d94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b79c3b9386sm43549423f8f.18.2025.08.12.01.27.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Aug 2025 01:27:30 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 12 Aug 2025 10:27:12 +0200
Subject: [PATCH v4 13/15] pinctrl: qcom: add infrastructure for marking pin
 functions as GPIOs
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250812-pinctrl-gpio-pinfuncs-v4-13-bb3906c55e64@linaro.org>
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
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1755;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=1TtCXH0c1SnNyHC+v6gZsytFHMfkLN/q6H3Fm9nBNlI=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBomvrZ/VR1c42/G4TctgjID2K26TyPL0+Vrg6x4
 9ryMo61KYWJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaJr62QAKCRARpy6gFHHX
 cvCLEACYvBW59+M3gJi5bBpvwd53LIDA7Fi09bh7cf6sZQwrhnc+q7Z7XDWdo3gOU7A4yZx8nrE
 lf5eZ6c3y4GemvfNQDbmd0gu0FBsb/49YwP4k87d87Cdt8fNQd/08Gh/u32vbVpO16l2Je9VuY8
 3WZS7KC5/KJQPKXbmxUpP5C2z8mULdzAb4PKQT3dZ3s7f2T+hMUUwinrZx5u1klaFQrlOXkNTTE
 ba1l7tJFuZ8cxCTDfvpt3YSkOLMkDNM5HWjtfxL/gfiQ11OM42MAVw/QrrA0hu0Ez37gjOlTBx8
 ZfQwmRq7Gx7f8H5yXUyG7PrHQL+qjkqv673/8cqJFGcqwAse7K8jlSiu5yAKyPafqYT3neO/k4u
 APj8e2LBEwVjTBl0IhJdS6/+3AlWncZFxd6E60ROpK0huq9Ds5Fv1bIjzPvmGW2GKpF9MFCbdd/
 LX+uj8t8HrERHsIxj8Mov/RLEFgf1ECdyKINeMXsW0lLsbYkkDL62TYt2+/nXHkr6BSKZ1JX3gQ
 HmqI5/Ni9xR1d9/yvtzD91OFmakZA9BucAoum0WdD/tWCaF24vSjO/wdUntMJqmkxYWMM4CY0ro
 B/bQkovAcHO+am85u11GmUCv0se9FwLnggtnVe9u5hXKsKp22bC+38tNUX6xqHYV+hSPyXCLYu8
 hN8vLrtlGpDakqA==
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



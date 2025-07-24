Return-Path: <linux-omap+bounces-4127-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E8557B10615
	for <lists+linux-omap@lfdr.de>; Thu, 24 Jul 2025 11:28:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6D25E1CE4692
	for <lists+linux-omap@lfdr.de>; Thu, 24 Jul 2025 09:28:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD77028C869;
	Thu, 24 Jul 2025 09:25:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="kbq37Ha4"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A22B9278142
	for <linux-omap@vger.kernel.org>; Thu, 24 Jul 2025 09:25:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753349106; cv=none; b=neLqGBNEMnt05qimvt+N7U+zZAtv0ZW2rKOHONzJ8Qrxs8djYgzvDUJ4F3vwKfak42uGs6oRW1T12xwkybkzG6dGVYO/3TI8En2LO3ma+r6/hMjtFsf/RTeXq5LypEak02WcW4Y8cTizzMjlAeXsGLwrWZw2ZKEJg4hvJhahDmw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753349106; c=relaxed/simple;
	bh=plZ1Vm1sypuKeTUPV0wUpXS3wYOgw+xh2WcUDF5pNJE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KRQmieUSZf77+6UHI02zFFHEp30SXq5mVbvAxHPuqxbMDORJ3Q0dCmVCBs0jxkJtaPQ4Pt7dNRtNlMeQ1FVlqZ/LvH+WiaW6B5DByO1F/U6RPR4TNCddKKeuJvdBXh/OCnc+lR7ypsWOm9/2rK8ZaUNQ2XHtPKRCW2c12F8Zmis=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=kbq37Ha4; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-3a575a988f9so427753f8f.0
        for <linux-omap@vger.kernel.org>; Thu, 24 Jul 2025 02:25:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1753349100; x=1753953900; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=p4qKUQTrFUgO06PuEy2CFUi9trDjc/5HjRv1X5gVEhM=;
        b=kbq37Ha4hcYsDkF4fsnj95W00/0InBevgCCSymQYM7c4PqSzHkQZ1hL/I5FdHaYKRG
         L9JrUpNIlcSF2ge1DVqjANzdYokmO7N75av78Dn7v6mTFLlBtTXbkeiJFKEehclsGuJq
         jFT8ZHj3y1mJe90TbFeV4iWCQznKImys9oByzI7OWcndcMK7CAVcJ+14vlf7SWZ8cTGJ
         RpSf5Th6iKGtJ/BuW6xcb5LKKe7XA2RLMGIK0KwVTnGVEPLBUFGwm5xOfj6G+OdpwQdl
         mfRdOGYjazDNAEZfI9VF6GVr7yyTuyAS+psuyC6cwQwRspZMIgB12W493FyhZZBveyyO
         6fPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753349100; x=1753953900;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p4qKUQTrFUgO06PuEy2CFUi9trDjc/5HjRv1X5gVEhM=;
        b=liTe4EiD8fvnm1WUdZ3R2mqXjCoy92vbTesrKJBC2KzJNks8/LAs6LbRsaT7k0xkRa
         x5qSUIyVZJRR6lH52LiXIJuU4hB/5OzSOIYjwlNG1eC8EZ4jrsREXtn3fMdKZHEEqIIJ
         qsAk/j6TaA3LV6u/y6udjMvAPrFwbIs4dbJ5Qi35n6B/8Rt6XkIczGAcsgCMcW4kUqYK
         QCWT/Px/79cHQqxeb5Nffwmkgm4qqqvD39L4bmpFaVXtbTWLT57kAq/vF2ISrNKfB+MU
         LGYnZZ3HON8dP431VAbGb9ZIJk/XHFzuWmJKrK51rdlFLoHj/vAZzojr86/rmW0rF8oT
         59jw==
X-Forwarded-Encrypted: i=1; AJvYcCUmrqcASwCBa9Q2BiPs9SM7OJ4r55uKV9XFinhxeOL5+zZgWjd3IBIffiUwtDZ0aw8r5nSS/4czcAmv@vger.kernel.org
X-Gm-Message-State: AOJu0YyFjb+hxsYpTFsCT5OYBUxfOlMEGYGuYMaxd8dZiTQkdxnKFE0F
	VDGEzNNXkVnfNE/o1UpMFoNJRecdKs7Dd5x+hvOTMdPVx6rlhyzHhmSCFFwDRE1cpGs=
X-Gm-Gg: ASbGncuMiZ0f0KgNnni7cGa+tBojsoZLOZCkQdoletnxW1ZvG/nG6UC1k/zVGEudfPY
	IzaPKjGBU7b9mpbcKr3ennLpWw1Vq5WBci2H5K6bywz/VbZKOtcxm6W+acrxhLTfJPTvnDIPVpV
	ZmNpL0HPP99wpT0x7Nx+vUnCARAtqUborhMFwRfhkB2EJPDxQaXXwLx/uJQTbu4bB1aGly5iMnq
	NPp5S08vYmkaV56R8ZvZ18gS7XybrMRQeElxIUW1JZUCnjsHKM72jR65d4zDEB9O/b38Bvb/vyZ
	hhi03Yp1hnGjMEvMjNjkKFCo096SS/+V5DWYrNSkOfmK95t96zSZb5FblvYQsCGQZANwGJgvo2t
	an+ekxLf3/37tclro
X-Google-Smtp-Source: AGHT+IFiU8ntOuIrsg7EJjoE+jgfBOjilWpCicMTZfx/w/wMWv+Cz6kJc3kzsI0KnGWbRP7+RQsGJQ==
X-Received: by 2002:a05:6000:2501:b0:3a4:dc42:a0c3 with SMTP id ffacd0b85a97d-3b768f2e43bmr4915869f8f.56.1753349099696;
        Thu, 24 Jul 2025 02:24:59 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:f44c:20db:7ada:b556])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b76fc72548sm1600833f8f.30.2025.07.24.02.24.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Jul 2025 02:24:59 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 24 Jul 2025 11:24:41 +0200
Subject: [PATCH v3 13/15] pinctrl: qcom: add infrastructure for marking pin
 functions as GPIOs
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250724-pinctrl-gpio-pinfuncs-v3-13-af4db9302de4@linaro.org>
References: <20250724-pinctrl-gpio-pinfuncs-v3-0-af4db9302de4@linaro.org>
In-Reply-To: <20250724-pinctrl-gpio-pinfuncs-v3-0-af4db9302de4@linaro.org>
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
 Geert Uytterhoeven <geert+renesas@glider.be>
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
 bh=V65C7Z+Y1YiPq0OHKNuy9LXqO2UhBPC3XEUxRkkrR4k=;
 b=kA0DAAoBEacuoBRx13IByyZiAGiB+9ShUR1OAFnIEDQG3sNgilmhY7Ygh6t/KE+2iWaFhFUfQ
 4kCMwQAAQoAHRYhBBad62wLw8RgE9LHnxGnLqAUcddyBQJogfvUAAoJEBGnLqAUcddyCt4P/19R
 usVp59cB9gmeC6caTopbcbPlDN95WhxRPi8vVSM0eahgEj4xziYJs019xI4Vc/dhRXH9v/sv4w5
 5V/98wav2sHArJ6Fwyy4TwBH2Fi70PGrZodDBC+XRwDmAFxjjdb5ZC70EkBefPFgqgWBJLHFbYK
 ERwWpuTdOjV3bR68Y+BCsI8vh9Of0hQhF4gyJj6bIdvXvlKGmd/OXIrHJqeatSdBYMWebikfG2h
 Ow7xy/+iqq+i6p4tWOubxuQ+yrYyiPvnsRIQt7j74iJO9N8kHSdgg/wuwIOdNANPFp3EsoYL0kK
 qa1Qg1hHn2GdMMp3oOXDTybNepcTiMtdkbI4jPFrei5Wi/pAZRaEfYoCaBoD1AkhZwRaNOHQQH0
 ljr1wEhPIjnp+8blcIaYZq8yVYvpNFc2j8IExWEsIXNTWECihGJxSYq27Kekunrv/FpYmZEsi+E
 grHegZHLUs5t0APfof6gAM5Dk+slyYb/GNzK8F6racQqxoEnZy+zBj52YU4q+yNxNcwylSh1b3V
 i3FtgIvC0j4c004+Y+yGAVzok9hidlMxP6cap3zpbStLEDVEte286WULSaZ0EbdfNkU66NC+ACK
 G3w6qEcvTn8zHUugxupweSvuC6MxhTVRA8uH4BAoi3nN2mf0gl1xU6dJWdB8ZlrrKBCQUuVoGsp
 K1qEy
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
index 965f0cceac56697bc4cdb851c8201db7508c042e..7010be8d1ace062fcf7743e539d2065d4aed856b 100644
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



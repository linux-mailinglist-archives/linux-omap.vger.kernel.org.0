Return-Path: <linux-omap+bounces-4240-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5443AB27CAE
	for <lists+linux-omap@lfdr.de>; Fri, 15 Aug 2025 11:18:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 124DD623AA4
	for <lists+linux-omap@lfdr.de>; Fri, 15 Aug 2025 09:13:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 56C9D261585;
	Fri, 15 Aug 2025 09:09:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="nwPSVJP8"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69D882E5431
	for <linux-omap@vger.kernel.org>; Fri, 15 Aug 2025 09:09:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755248987; cv=none; b=LLqtjXXJp3V2YFQpZmI+WPzWu6U3PauNO/mgzL87ylUBz0Wzr83qata+0/4M6i7t3eIFBA1oBvjJ+4Izy/XR7dIwcIK6gkSopbv5csQYrb/jw3cdu+iA2ixGjbJ/vTXWqpvcRvEs2GgrzYaoim1VCBenT1Y85u1EiTCFhZ7qLDA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755248987; c=relaxed/simple;
	bh=RFujl0Cr/YaORxwURfe0zTKDzCwOsKiOevFTrddSrvg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CC0PRbYZSsQ6guA957tZJ9bBHBQfvdkhDFY/ZiTdUnvL0d5F06oB3vOJ8ifbOc55u1/wlp/WI9koNsX4YwZm3ibarQhKeE6mhGsz39GwgJXhAnQL8UGxSo3eUVq7JjBJLooN2nR3CxsTsnNk9K+qBhFQWFT2Bo4CEsgQdk4FAeA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=nwPSVJP8; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-3b9dc5cd4cbso1313288f8f.1
        for <linux-omap@vger.kernel.org>; Fri, 15 Aug 2025 02:09:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1755248981; x=1755853781; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jAO2WeXDFkbtwkjKyd1xrqU98u0EGyjojmTyXcAuE7w=;
        b=nwPSVJP8PNQZglWu7s1RRRcQza/NcW6MSysM9IfnFWgr4WpgZz8taka9NfK0c6fE3p
         AtCV/0lFIYI8yq8GQsm6an+VfRKGK7JhczRVc048QMo1fBwXkCtie7iOaLYvAykQqQfS
         7zzQwKhRKCOOBIdEZ5oisXzx3EVY4CSYjdzX2967BVldvdk6PxPY76kTZipXqcJxxlUa
         vfwqbKWKlp1hU7guGCSLzdv2BkKJL8IM1P/nrnr4qrexspCK2RO/b5NVbj/oql5mWwmO
         o2zh3SJosu1HKz4xJkANU8rmhIXADXVLMniliRZXL39YfqOWOKCM/vf0KFLFYiMbUwQt
         7nrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755248981; x=1755853781;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jAO2WeXDFkbtwkjKyd1xrqU98u0EGyjojmTyXcAuE7w=;
        b=tOvyz4F2+HIchAcWCj8kBbFTaSsHJ39i1qKwq/seu8Ytr/YPQhCjBHsqZh3FmKL68T
         MfUt9WClWouFG0LdiOXEfGmdbYU+JorTilrmDVWFtn8mgsaBJM9LezFnFpzgXV+MVJ1Y
         KeTjMoJ86SBltznaxAk/mL6mFYPCZ+bXR2PedvrDtLNYBO2yGjXbjXyQecOU8dg3lgzl
         LtOkbm3Qfexff+ylI/DekC9WXuZesUiIctlkENTfcFu8u+7zZtSKqRmGyU5QYi3zS+sB
         WxzvRS4hodNoLJYtcB1dPepchqUk3nH6RItx5nV0DpiYlUKddOgWk7daj5pCRkHaHlhw
         pQZA==
X-Forwarded-Encrypted: i=1; AJvYcCV8OAp/0LtLPSx7PPw8l5aZkaLFC9zgY4E7btEhTpSfUgeSwFK6ov88fKCzEUsqK0E/kuGD+CQGLOWP@vger.kernel.org
X-Gm-Message-State: AOJu0YzpNibvdHGDH1xyRigRTnb/Ipioclqk7s/gavheGAwLmQFqkbhv
	faYdJ33PiTVw+NuQuX6eNskV4+0l5MRZcxgDhEjGZizWV1c4nX365sbjwfxTpgIAYRg=
X-Gm-Gg: ASbGnctEdnnd0TEbCC0RPdD48Nqk4I6HDgt2hyvLc2kwDv/XHMz+UzpQ+p6PBCzUpCS
	BcqWWrOD+dOqwqJhZltWnlRthefrt9o+IECEjmSubS8EBKiHN5bEawUeQl1Wx3k+/PWvZfSIzqx
	jNRBx+8Ii1eDWJGdazNpCgdXzgLQ54fYhDH/Y5jd08I67MKgFI7h3q761ZYF21COOS5VOVZ7KBM
	s/IHmKQdCXRukBUIyncm1ioQOsmtTRMfrHWNc+JKXb6z5IAG0IrRDyzB0TN45iU5Z5Q4p2Xo6Po
	XBk4Q0QcfjHHbOhRnE1hPZbUE+Dy1B3Jwd3/iRIYdE71lXPhkdAyHmPQoPblLOhbM5GzYCI3u0M
	htFOXSfW2r3FwMMtUog==
X-Google-Smtp-Source: AGHT+IH6u9qd88jYtkMUMO7Pk2wdt7IioAAqpR67Wlnaqpb4Xq5KR98LGHT/fAn80hsOAq7ogVV7XQ==
X-Received: by 2002:a05:6000:3108:b0:3b8:d8cc:dcf3 with SMTP id ffacd0b85a97d-3bb68921b21mr916109f8f.29.1755248981350;
        Fri, 15 Aug 2025 02:09:41 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:a125:bd3e:6904:c9f9])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3bb676c9a67sm1205210f8f.35.2025.08.15.02.09.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Aug 2025 02:09:40 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 15 Aug 2025 11:09:17 +0200
Subject: [PATCH v5 15/15] pinctrl: qcom: make the pinmuxing strict
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250815-pinctrl-gpio-pinfuncs-v5-15-955de9fd91db@linaro.org>
References: <20250815-pinctrl-gpio-pinfuncs-v5-0-955de9fd91db@linaro.org>
In-Reply-To: <20250815-pinctrl-gpio-pinfuncs-v5-0-955de9fd91db@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1142;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=M6AAfE1ZYIqFZsBoDZ4O1bJllvK/6bMXFJ6Zryc+i/E=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBonvk6E0B63uoFwvdNfdM6shEMGyPseEvOlsf0/
 xE/Q7RcUMmJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaJ75OgAKCRARpy6gFHHX
 cgUiEADKwU+j0rwTCMMo4gp+q9WJ8f3aBc4TC+eTJd7Rb68K/vvR8mQoOObnc5vYp4f1bGS5hjx
 nhb+kFiHt9322cnLeohSt3ZOFPCzHPEj2QRLHCoHJ/Z//LaWVcxvSNu/k5B0wuFON9igEj3HZnu
 cpu9eGKkr2mIAfESMNu2yXlUPQB5vXtiZ9y0GkHRefEdE18uLI39sKYfWLR/ZeMGcUUp86JjYUr
 2BJ39RDdZCMbvLjh8df1T6RwANJSK2q7RbAnM1uvo7hUhvPnQYiTe8yo4a3aELWbv/TVbD9jT8K
 ZXGeUzH85xQKEQ0JTjzReXrxA748Oyq3uLoLuL1GzHqTkRiMnu18+BBTvaCr3u4TB8SVgkbF6Ls
 AUXyGIRAk5hGTn6lf6aeYN+NrvwvlvPtCtdN8ZTpi6p4GT0PfS0o1QOMVO8X0DrcDLo6nilrVyp
 GKZ4vywviTy/wxChO1vznkIdtfA5ylI00rp9tKrccz4rpnda311StQvjVC9o1Py9DeKtv0cGGh9
 SJ4Mcj0suKefpRxOr8UWj05HldOdGpacP8CC7eTEE6LPapXVPDfkem2wLu4/01B+kl8N2cVPOdn
 io4s9PHmIyv1eMTsFNfIOUPPLb+j7PMBFXlGzqUadBKgYD6NcwP8wBOIeXNI5r7bkDQb8eF19oG
 qT+jLfULiytDlBw==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

The strict flag in struct pinmux_ops disallows the usage of the same pin
as a GPIO and for another function. Without it, a rouge user-space
process with enough privileges (or even a buggy driver) can request a
used pin as GPIO and drive it, potentially confusing devices or even
crashing the system. Set it globally for all pinctrl-msm users.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/pinctrl/qcom/pinctrl-msm.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pinctrl/qcom/pinctrl-msm.c b/drivers/pinctrl/qcom/pinctrl-msm.c
index a5f69464827119dfe2a7781b558094b283fca215..1751d838ce95d6138c824b90098f74891dec7656 100644
--- a/drivers/pinctrl/qcom/pinctrl-msm.c
+++ b/drivers/pinctrl/qcom/pinctrl-msm.c
@@ -268,6 +268,7 @@ static const struct pinmux_ops msm_pinmux_ops = {
 	.function_is_gpio	= pinmux_generic_function_is_gpio,
 	.gpio_request_enable	= msm_pinmux_request_gpio,
 	.set_mux		= msm_pinmux_set_mux,
+	.strict			= true,
 };
 
 static int msm_config_reg(struct msm_pinctrl *pctrl,

-- 
2.48.1



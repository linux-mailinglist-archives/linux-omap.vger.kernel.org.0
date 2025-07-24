Return-Path: <linux-omap+bounces-4128-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E5D9B1061C
	for <lists+linux-omap@lfdr.de>; Thu, 24 Jul 2025 11:28:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 497B54E4BA7
	for <lists+linux-omap@lfdr.de>; Thu, 24 Jul 2025 09:27:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E30D29B8C2;
	Thu, 24 Jul 2025 09:25:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="pZC6z7/L"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3964A28B419
	for <linux-omap@vger.kernel.org>; Thu, 24 Jul 2025 09:25:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753349107; cv=none; b=K5oR4/fawfQbxEjbOf4ngTx64/oHcvvRoYcAtUywfOPziZvMHIzOPIr7TduKHk2bO+k1jILPqQAlNrBvXwu6/TCkw0urJ1TVNgHAYyYZfCfH1e1N6VjRVbsyP4Q6Qu0OmQU9Dj7SsUcYDqfNXuc4eXBeMHGTqiq38bQ6wWtRA10=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753349107; c=relaxed/simple;
	bh=j3hEB3uHMyfG6UC6xkEhr2jxijr1UzMwpOtvGPojo1c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hN+9wJ+z+bgD0Kl3OUCBR14fAskjyUzKvyoMsWPjh16MUVkcug9gpM+p+BCyyMFLP0mNAqot5Ewp/X461Hm7udqlKZNepxj2ORPE1+EoKAVnwNk/Mqf9ZgedJLwwwQavppgxYyIYzuj3aKFg+i1fmX5MaU5I7GDZqMcctQEVZns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=pZC6z7/L; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-3a57ae5cb17so368318f8f.0
        for <linux-omap@vger.kernel.org>; Thu, 24 Jul 2025 02:25:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1753349103; x=1753953903; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=h4a+gzu7f3EwTZaPbk859mLIqTYIGZRRwraHyXMWvss=;
        b=pZC6z7/LGtdQGVWRpYaTHqcqRGRzUPMXs5mzavTko1zC2wIanFvf9U0DddlnTl01By
         l/sg4duxd9Q26ivVXRMiaT7Gp0V4wFOf40Sh8+RIQJPJM4jpUG8ltrQLCu5gF5FvD2mF
         1C3xRF39UubD+CfRVByGnbT0Pgl2q3ySpHnufDVIWhq52ZmeTnfcFz0qb2CTN7DbZrIo
         8WL8Cc7X584qxA+y/UFkNCfh1MduOYnBafRW/uMsR2xU7SoSN1Fe7bqKqGXcBsf6Ostl
         DhWkoqlLqaFvaVAIT/poJa9ZwBo94qHYA2YbhD0aQstzDGRDdRomoIG02mV3uLit5+0b
         pRxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753349103; x=1753953903;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h4a+gzu7f3EwTZaPbk859mLIqTYIGZRRwraHyXMWvss=;
        b=Ec8rzvY0Ps88HNBsWp+EVZ7XQsCz4jP7n0lm4bbbGkLnOEQOMv+Mifp3hZbSRblHEt
         9hA2dKZun2M2pDx5IJdAFfp/Xp0dbQTcw363v6q3RvuTj4ATCCkBs+xwWdh/4lBp+56n
         amPJzRg1wrkFzjexQuIJZowT4osS5GpM0e+Jy/WGYl4KJK9u1GPby4J0tcLa8iMDUwGo
         G4+DdwkD1kcF+hj6n8mTulI60sCBnxuHt//p4u7HxmDvp1KmHkIcmG8ZVhBUlBOdnxKE
         7eSrDTEzrMPaIRSLh5hJzQAQTpUzr0/d9yT/sCbvgHeKsenWFZtcKxFALG/4r91XB7qD
         nn2A==
X-Forwarded-Encrypted: i=1; AJvYcCXnLZZgytvtr8dx5UlryQJRQW3qL4WbF9Vs3Wc2vsocK+r2TBaweuMwXGJtKkELTXWN7cPTqLs+w0mV@vger.kernel.org
X-Gm-Message-State: AOJu0Yy59kktBEfLrdCTkC7BoraWRg09JC9VBFE7jZ8hJsHEpNYN+Ugh
	5aYsrovxfvHXLr9zqsfKhNB3FqZrjt12Y6xtmHENzoRpT6WcOXTkab9k1E7MvJiuVg0=
X-Gm-Gg: ASbGncsO7f0f8rUsiY20/EzjMsRJDPW/2eA6lkpKz3WYiUEqqPeKRavbH6hgrv09GyZ
	8G10mQPcoUiM+BSH/rMiagxY3Q0b4R7tJbFoFepe1rvvVR5zqmLOSA7klcXWgx8ebGSErW6nim2
	jEf5NKcNQNstzbLln43dl6rrpGrp0l2BpOQKzJUTKFVID44bGJ28SApYP7fmtbIhmpUtlafFYAI
	M5JQ+0MYzoyRvFYmvWhg1srvYxYzYE9xH6S812u4ARJ1qCbUQwpIkPj9WTat/IZyrumdvq2iLz1
	moBLavEOWEp3ioKg57PXCL73+zLr6lZUeVlsZ9GB8hDd1xRMvfwS4vtlcdBt624dJRKM7ryhy2T
	SwulJKYUZ8pSMAjy5
X-Google-Smtp-Source: AGHT+IH0iAkuA6GzMHME9lyvaFVrb9WaSOmQdANpljoKy1DeZvDX7IaJl8X91dcX7f0LjUclpn3P5A==
X-Received: by 2002:a05:6000:1447:b0:3a5:2b75:56cc with SMTP id ffacd0b85a97d-3b768cb3ac1mr4981697f8f.23.1753349103057;
        Thu, 24 Jul 2025 02:25:03 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:f44c:20db:7ada:b556])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b76fc72548sm1600833f8f.30.2025.07.24.02.25.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Jul 2025 02:25:02 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 24 Jul 2025 11:24:43 +0200
Subject: [PATCH v3 15/15] pinctrl: qcom: make the pinmuxing strict
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250724-pinctrl-gpio-pinfuncs-v3-15-af4db9302de4@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1142;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=M36QPREHYk2Y1Ol3wL/sT7z2U9JVD+MimNp7WJSOHU0=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBogfvUuNqnvhBaTQ7E02dLbZ93XPdMix/+wojXR
 G62efWlN2eJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaIH71AAKCRARpy6gFHHX
 csIEEACcYzcalCunEHwwLc8fC351P1QZ0/EviGqXfAPEAKDWr3P+rwFdN2Ta12zzVjBkLzjyQ91
 Zv3Pyd8ByzwdIUsKqqnTCqQXU561HpvlpivEPwqQfk2Fv1/z8zXTLdhqLYeWc2DtYwXVL47+ep1
 hvPNS0sKjxZZSbhD2Cv0so7lDbU9TIvO8FfROCo+OUmJ+fNRIHwJdm3DZ3UCBbKrfqj0JKqwStC
 SmdBFpZg+RC6pqBdqVp2puRBkrX4kkPXma3WhGUgbQa/jdRrzeKTzhOecZSN78aF+JYuAOuEWas
 9ZYmbC12bDFImUccK4LcZfdm6UKPE66KoyCTfbJSdLsUaafuNUop1v3HMU+T1Qr/Xjdxcfc1d72
 xDxNII3sKlNkkl6WGjDNi7bqM437VkY4D3MqKo2PdUpL8pWVacs90dpKk/TeHcMZqMlSPpWf6Ir
 w0BoC8kdAtDjE9Xmx8h4NgBJrMuqyRB+w2H/MkSVj85rAH3A8nrxlRd/vqL77bGkehXfVeY7coP
 hWnYxxxDdbXZTNWgEpW4pWcbFrtw2pyKmva81FwQzEbINBVc2nQJQb2Qpd68J7/3170a6GFWyeN
 MElcFiUfHMZhzI5U6MPEUSceL4b9e10SrngoFXdrORgydvHqnRID4/lq5Qv8dryavy2pK7C0AN1
 RovE1kMQsSfBwRA==
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
index 7010be8d1ace062fcf7743e539d2065d4aed856b..ad572c923e2ab8caed134207ec02c4107d4dc2bd 100644
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



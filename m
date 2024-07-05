Return-Path: <linux-omap+bounces-1733-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B581928185
	for <lists+linux-omap@lfdr.de>; Fri,  5 Jul 2024 07:51:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A92DA1F230AD
	for <lists+linux-omap@lfdr.de>; Fri,  5 Jul 2024 05:51:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B99FF13BC3E;
	Fri,  5 Jul 2024 05:50:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ihRNNYPO"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8BD013A869;
	Fri,  5 Jul 2024 05:50:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720158656; cv=none; b=KCJXDtJC2y3auJrjAoUDEkcsB+RSont9ht/NL+/0pOGY9G2bRm3V+rmTWLzzxQvogCqOEHuJYbQ02OKkDiXlyCDKU7w8VE0VwnOuX1ohX1OwmBhRA5CKqf38iwo5qqoQl8G+XmlOpKauQVT9b5CkJ2ZXrxe8U1kn3+OxrdhslTQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720158656; c=relaxed/simple;
	bh=JrLj91YPVZpy2XkIrYFYm75kBGBGgkOBeCe9zPn1RlU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TyT2TYjoCoFwVLDLqdi90fsKQrZOKpuhm2bjtgq2U30VzuIiGNi062K50vHoOrciGNbE1H1t2A/GCOYRXyT7XTKP6GUNWPSH2c+bIS0A+IGp//v2QQ/Ai0cS0mrlIk8d71cs4oPn3kh2lqNKH+JwgTFiVAZTT0AdUxWdJtVLa/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ihRNNYPO; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-2ec3f875e68so15418781fa.0;
        Thu, 04 Jul 2024 22:50:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720158652; x=1720763452; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tbiPVN/BaSDz+daEINbCMF5/eDCLCv2CP3RxKuEyuuY=;
        b=ihRNNYPOioYPJddJC6O9E4vd9nGqxz4xnMlDUMl+CM0ztiXBazDpELnOrXRQWE3g32
         F9HVXDN1Be/ACsK21+QnUzjlLP86y4zUqnMwexNtL45ucvfeuCEqaq5KDTmRGBK+Gn3f
         CtxJozmh9WlSf1PpdENsZfg8bs3pUWdjM48e9WyKufM3C79KEdam2BzfRqOFZ6pJyhpj
         A5ebDL0HYxv9nKTBJd3Qclb5Krj+ZVqINAO0H1IJVPll4huw4c0CKmpextmeh/N/Uvcr
         N1DQEHTtkUAZrjm75C8/HPPY1KoilfKTKqDpNayvLh9pHSjxsO2ID3k1X/EN058p8k47
         Lncw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720158652; x=1720763452;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tbiPVN/BaSDz+daEINbCMF5/eDCLCv2CP3RxKuEyuuY=;
        b=WcNly0YOECsvf63zHjspLKa8ga6FH3396kiPgU3ReCqE2NEQasY+aXA0e35g2YbgQQ
         PLIb+Svh5nXN3NrhjfD6Yh1nL3L5ChgsQWtCgqzfNB0lZgo6UpuTByxq1LA3NrUpsBpg
         fNvsr0ihKQOlny1iQP2PxPOTGgN20NrfcHPLiyGlGD2uAuy3cpuPT6m30j+ikPEeXJ2A
         5vQwmF1RENA/SKXSNyhC7Nw5wLrb4jqxac4atLM5L/Ob8hRN7cxkQwZPc13h4Jmh6QfW
         /ngJybz6nPP5wkRcB8OlG72K4SoZYXMrs0Q2+JrcyY0Coui6+FVHlwJBRgpP0xDwhfxD
         74ZQ==
X-Forwarded-Encrypted: i=1; AJvYcCW3tuCrbj5Fdx1sQssxhHedMVpTdMfFCKze3v5s+bZ2sCtHXc17uEV9aT2o+2TRkOBTNqZdRxlQAcudep9LSctWmfBZFUJA7ym47RhoVYb+LGKbjPd/k5p/+s5xs5SR58nm1D0vTE15M/+7iJr9
X-Gm-Message-State: AOJu0YxXu6qWpAJ23JpuNOr15lYe8/7ZQanO0KLZxVGit8VL2HvQsweq
	cGmnDimRm9PG9eAUs0qjBTcGVIQMueKuKkmHKs3NK5GTaKNXfnf0
X-Google-Smtp-Source: AGHT+IEpL0Mf1EKOoiMjLyxqd9bytkbdSwdDuZnIv53bLozrxliwMa2PYXZdfQHo1c1KgldzxRAFXQ==
X-Received: by 2002:a05:651c:19a2:b0:2ea:e98e:4399 with SMTP id 38308e7fff4ca-2ee8ee01aa7mr30757671fa.36.1720158651428;
        Thu, 04 Jul 2024 22:50:51 -0700 (PDT)
Received: from ?IPV6:2a10:a5c0:800d:dd00:8cfe:d6e7:6701:9dfd? ([2a10:a5c0:800d:dd00:8cfe:d6e7:6701:9dfd])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2ee8cabf202sm5086491fa.99.2024.07.04.22.50.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Jul 2024 22:50:50 -0700 (PDT)
Message-ID: <20ce567c-d3be-47e1-8e73-749756204b43@gmail.com>
Date: Fri, 5 Jul 2024 08:50:49 +0300
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 09/24] mfd: bd9571mwv: Constify struct regmap_irq_chip
To: Javier Carrasco <javier.carrasco.cruz@gmail.com>,
 Support Opensource <support.opensource@diasemi.com>,
 Lee Jones <lee@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Xu Yilun <yilun.xu@intel.com>,
 Tom Rix <trix@redhat.com>, Marek Vasut <marek.vasut+renesas@gmail.com>,
 Andy Shevchenko <andy@kernel.org>, Tony Lindgren <tony@atomide.com>,
 Tim Harvey <tharvey@gateworks.com>, Orson Zhai <orsonzhai@gmail.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Chunyan Zhang <zhang.lyra@gmail.com>
Cc: linux-kernel@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-renesas-soc@vger.kernel.org,
 linux-omap@vger.kernel.org
References: <20240704-mfd-const-regmap_config-v2-0-0c8785b1331d@gmail.com>
 <20240704-mfd-const-regmap_config-v2-9-0c8785b1331d@gmail.com>
Content-Language: en-US, en-GB
From: Matti Vaittinen <mazziesaccount@gmail.com>
In-Reply-To: <20240704-mfd-const-regmap_config-v2-9-0c8785b1331d@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/4/24 20:23, Javier Carrasco wrote:
> `bd9571mwv_irq_chip` and `bd9574mwf_irq_chip` are not modified and can
> be declared as const to move their data to a read-only section.
> 
> Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>

Reviewed-by: Matti Vaittinen <mazziesaccount@gmail.com>

-- 
Matti Vaittinen
Linux kernel developer at ROHM Semiconductors
Oulu Finland

~~ When things go utterly wrong vim users can always type :help! ~~



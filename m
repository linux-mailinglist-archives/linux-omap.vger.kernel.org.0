Return-Path: <linux-omap+bounces-1200-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id C52AC8A50A9
	for <lists+linux-omap@lfdr.de>; Mon, 15 Apr 2024 15:14:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 290DBB232B6
	for <lists+linux-omap@lfdr.de>; Mon, 15 Apr 2024 13:14:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A88D413C681;
	Mon, 15 Apr 2024 12:54:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="d/BAcgST"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3B1513C680
	for <linux-omap@vger.kernel.org>; Mon, 15 Apr 2024 12:54:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713185679; cv=none; b=kS4//J2VqF4OXBNW3oB/eCCLTXboOIfgyOyU65iEKfDnS5//QB7ftEhSV3V1hIb06hrWTkk4+ruXDw1por4pi/tCUz6mui0fd//CODcS/q/JewZUcwzLG4eAgM6mne9QZhuNR/2ia6eC2iKYqO0Ah7jF0UEdFhJaqJra3RXG60M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713185679; c=relaxed/simple;
	bh=QuhwG+KvJtimhWZKcxuFPkQLiPrb/07vzj/We9k9VWQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mwmEkNfeVIfRN5yvem3rJyWzyjzT5WNkRLMu5kHNiknHwNe5CLlcxUG2yW/mMyi43tfvGJ7NLFLw4THrzqaG3Z0Zw/0erleED7pTTi02KbPLsd55ln/9z0l/lRBhehaNvXjGXWg3HcpNAUi8dWE/PRm0IaOjah0txKlOvvUbEvA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=d/BAcgST; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-3454fbdd88aso2886073f8f.3
        for <linux-omap@vger.kernel.org>; Mon, 15 Apr 2024 05:54:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713185676; x=1713790476; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=QuhwG+KvJtimhWZKcxuFPkQLiPrb/07vzj/We9k9VWQ=;
        b=d/BAcgST47SaMiPPMJlp/T3YZ//KtPn/8jOpR499AaNRtFKQv38KWLIwSGsHuLK0Ph
         f/8cIGW+tZtzwv7OVU7sL/CQjeiTm1uve+tL/KL0lOFhcJ6AOlrkIq7rbddA5TFfcKLt
         k+mLMws2UQ4LAmSh22dfa9GS39UpY/6tU49s8WTCSjwKmeuUYOkx6t0rcHO2RAzukSuA
         S3d6fzxWS9zvwzgDrAxo7g0t4CcUY3otBhE8K30wQRpkU4B1B0LI5dvY3oeABSZafK+e
         8yETm2KVzeEiwILc69+UmmzPXlGRSF4cmYDVTlZ2NDhUrxtA28R9i0sWKtFGOUQZa2nz
         GiYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713185676; x=1713790476;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QuhwG+KvJtimhWZKcxuFPkQLiPrb/07vzj/We9k9VWQ=;
        b=eqBCBE4SxcQpaSiBJGS6zDfOyKy93fTm23CsM++lI3PJkMaUfvwtMlLT+ocdVmsPpi
         uSahuimq00W+sslbeDWDycdRdwWUn4BmVTF5ZKrvBWuiWVDwEL9vgS9Ntjgd7nx9bVt+
         LywXBXzGk0+W3kPE0bNbMvrQEAgOidoVjWL5B1ozhfeuVCbKR5/NJsdcXZKDaZ23xZ/V
         R2SNHQDpSvrgzxRmHmgVBpkDP2EYls2cFGigLUT79w5Dcm5syePmXuWhp1d32xQUXrev
         +RwhrFe/cLf5h4K020tcFoAi+JIrRo8HRjnCchPCMsJc94X6jRaSEs0gD2oAr7g15/gm
         LpsA==
X-Forwarded-Encrypted: i=1; AJvYcCXhgldJax2vhclkkKvh0RT5AxpfOeACtSgxFqxx/qaGQxpqfi6b7KdFVBjzbcbLOC+zGLjBG0slHqrrN1c7+FYVVgmXys7Nfu3vgg==
X-Gm-Message-State: AOJu0Yypt5xgToh8+vkEwydBwRyni//Sso8dQBPM8fzIV84mz9xrarP8
	GZXBXyp5n7dqPCLFq2jpvvAfY3Nmyx2vubxI9SVJTB1n5mNwECzfrhxbUuITTM8=
X-Google-Smtp-Source: AGHT+IEPwOHcdqSsBfyETbLBvAQKa/2hIYBPy4DXezVg6jyWxDrnmy5YGJEuZgB1Fbd9ZZPXlD2MlA==
X-Received: by 2002:adf:e545:0:b0:33e:7fbc:caea with SMTP id z5-20020adfe545000000b0033e7fbccaeamr7391360wrm.34.1713185676156;
        Mon, 15 Apr 2024 05:54:36 -0700 (PDT)
Received: from aspen.lan (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
        by smtp.gmail.com with ESMTPSA id w6-20020a5d4b46000000b00341c7129e28sm12009728wrs.91.2024.04.15.05.54.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Apr 2024 05:54:35 -0700 (PDT)
Date: Mon, 15 Apr 2024 13:54:33 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Lee Jones <lee@kernel.org>, Jingoo Han <jingoohan1@gmail.com>,
	Helge Deller <deller@gmx.de>,
	Bruno =?iso-8859-1?Q?Pr=E9mont?= <bonbons@linux-vserver.org>,
	Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>,
	Alexander Shiyan <shc_work@mail.ru>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>, Fabio Estevam <festevam@gmail.com>,
	dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-input@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
	linux-omap@vger.kernel.org
Subject: Re: [PATCH 11/18] backlight: ltv350qv: Constify lcd_ops
Message-ID: <20240415125433.GK222427@aspen.lan>
References: <20240414-video-backlight-lcd-ops-v1-0-9b37fcbf546a@kernel.org>
 <20240414-video-backlight-lcd-ops-v1-11-9b37fcbf546a@kernel.org>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240414-video-backlight-lcd-ops-v1-11-9b37fcbf546a@kernel.org>

On Sun, Apr 14, 2024 at 06:36:09PM +0200, Krzysztof Kozlowski wrote:
> 'struct lcd_ops' is not modified by core backlight code, so it can be
> made const for increased code safety.
>
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>


Daniel.


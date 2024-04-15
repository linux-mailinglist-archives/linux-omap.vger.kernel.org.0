Return-Path: <linux-omap+bounces-1192-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 23DAC8A4F7B
	for <lists+linux-omap@lfdr.de>; Mon, 15 Apr 2024 14:48:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 398971C21246
	for <lists+linux-omap@lfdr.de>; Mon, 15 Apr 2024 12:48:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A4F8271739;
	Mon, 15 Apr 2024 12:48:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SSJcsbZV"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E36A87172B
	for <linux-omap@vger.kernel.org>; Mon, 15 Apr 2024 12:48:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713185330; cv=none; b=r7qDCqngUZ2Azx8OmV8RtENj+vOYAq0DyKkR3t7g7ll/iuAORR2kHINjTiRh3NiqdFcRagJn+dLtC7tbYPpElV/CpeyOcPQP6AAqp2KKzpkskZtgYJODhnm41ZJ77qlk5BFmxZEc8xQ5K1y3mQ9mQomkXcd59/sFpR88Stwr6dA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713185330; c=relaxed/simple;
	bh=fYBgV11sH3JLVboFSXkJgCoU/xJb2f3Jo4YenY/vo9Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bklvVuKDRbAp4cW/ZuiInMnr56C83dgMNgPFSzwzDRllf9JMzVwZ++cyWmhwe9YN7TpXXIlps/0S3zVe/OTuepMw/SU3yeCBQ9gMEd3uV7pmyCYM7WfZN10jmN3ckrGz+UdPf57T7gJVwmCWRfbWvf/IJUsYbOH7ooqHLKql60Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=SSJcsbZV; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-41879f3d204so2432435e9.3
        for <linux-omap@vger.kernel.org>; Mon, 15 Apr 2024 05:48:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713185327; x=1713790127; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=fYBgV11sH3JLVboFSXkJgCoU/xJb2f3Jo4YenY/vo9Y=;
        b=SSJcsbZV802A6FbFgaQ/sICCSCHOxZTqj276nqflCcLgmSVhR69xhwgRgYV1/ts15V
         HQnsV3ZKaOljE8SfBHUnbp7f89J/0GVdW1c7/IyhuIV/VwCNTxcmkU4z3MVcvEvjJVeE
         QdlxHE3oC3GqPVRSbjq7LR9qH5Phjx/zCNH6SgSRErE1psCN6ePnBRXS333zMHn0U2CJ
         baqMc4zl5VIlU2TK2uxGDkMG2e78JT4T8SiJlBcYFPiLBJyrMeYzCZaxa+LfsneV+x1S
         LzPocwv/DMXuaLO2ymTAAgwOkwStmr8N3rnpO7BtaQRGXHwjIPYTKes2kbY9iheiWjBq
         EsIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713185327; x=1713790127;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fYBgV11sH3JLVboFSXkJgCoU/xJb2f3Jo4YenY/vo9Y=;
        b=S4LXs3N5PmZRblIYEL8vvSHMFr56H9kGmnYHrRaTcAJcot2T2tHeUxM/PeA9jblDYv
         fjkg/4/d8i+1Jc9Np4IrvgNykL+XAa8ygHXsVspmcB2iIHkisxdoo+Viw0DlYFZ7tDGy
         O3h1Ru/z0kpFkzm20P1XQd++pl2jVIocQUkqxROViWk6bU9BwGzMmIomDTppWPvFdsZ0
         ispFqg/jU7JTSbgRgxefrXLOf9S6coJirbaNswogpy1KCEotOizLRb8MLMIzGfMb4rj3
         GGk0ILFfnRgx5hVACTf6AOs/jW5RyuVIBbYydxCyAC/t0jYIt95FpLCeE9fKjZICCFG/
         x8yg==
X-Forwarded-Encrypted: i=1; AJvYcCU3Fh1aqMoE17dlEB7C99GR9ZQ/GBUo6+pXoHe6JGr2f9tp6LDOitqO9h2GaIr8jNGjFp2W9dZmUUfczg3G2oLX/OhaOn4NSer6yg==
X-Gm-Message-State: AOJu0YyHm4YJNT54uy6AAOODA16eIGhlFZfxSCNy9XUfAGzduB5qXI+9
	Vc/NFB0EDcT6W7Lv1pM7POMStrvmUTqjlB4576HOWRIghxfzl2ClFKb6Z6OJfUM=
X-Google-Smtp-Source: AGHT+IHAa4VIIZPfYQm1PVHVmrI/agaXvepugvesuVkXOga7yarPxPBfCgzSQL+8bsNFdokUf2ibJw==
X-Received: by 2002:a05:600c:3511:b0:418:3f54:1132 with SMTP id h17-20020a05600c351100b004183f541132mr3484001wmq.12.1713185327355;
        Mon, 15 Apr 2024 05:48:47 -0700 (PDT)
Received: from aspen.lan (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
        by smtp.gmail.com with ESMTPSA id a13-20020a05600c348d00b004186eb69a55sm2411188wmq.25.2024.04.15.05.48.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Apr 2024 05:48:47 -0700 (PDT)
Date: Mon, 15 Apr 2024 13:48:45 +0100
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
Subject: Re: [PATCH 03/18] backlight: corgi_lcd: Constify lcd_ops
Message-ID: <20240415124845.GC222427@aspen.lan>
References: <20240414-video-backlight-lcd-ops-v1-0-9b37fcbf546a@kernel.org>
 <20240414-video-backlight-lcd-ops-v1-3-9b37fcbf546a@kernel.org>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240414-video-backlight-lcd-ops-v1-3-9b37fcbf546a@kernel.org>

On Sun, Apr 14, 2024 at 06:36:01PM +0200, Krzysztof Kozlowski wrote:
> 'struct lcd_ops' is not modified by core backlight code, so it can be
> made const for increased code safety.
>
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>


Daniel.


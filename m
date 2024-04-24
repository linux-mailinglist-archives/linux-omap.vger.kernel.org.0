Return-Path: <linux-omap+bounces-1282-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 210068B06F5
	for <lists+linux-omap@lfdr.de>; Wed, 24 Apr 2024 12:08:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 53949B26CC7
	for <lists+linux-omap@lfdr.de>; Wed, 24 Apr 2024 10:08:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A37E15920D;
	Wed, 24 Apr 2024 10:08:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jqfmimjy"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FF211591EE
	for <linux-omap@vger.kernel.org>; Wed, 24 Apr 2024 10:08:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713953301; cv=none; b=lKqDPTFOiZ5kY0wwpsyEifluY7BFfi7WJwvVE9VoWBg6XSGb/koxenwEoIfNBer63kiHQR7diMDPWVsL9YgXJ8N5+gykVVNN6HJ9IjimN2CjEtxojo9zTJTUbSaJA4x9miUO4CtnbaJewZca/Ir6ebNbRe3rSRyZsXMZAfooct4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713953301; c=relaxed/simple;
	bh=hWKDax4TuNvBE1FyIl8irPm+6EhpYQ3vGRHf4jX8q2k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=m5B6bGunhYyePBzkqYl1xIpkwuhoOflkPUx2cKP+y2PkiuEwWIcNKNPF+RZkLUCpv/UbM+qO+er3o9BSpsnX8h6ZhGZm5yJIdouuhA3X0vb9vinLRSeu1w/NA0YiEs3WpIgTj43MyHWOrZ0qoPjfiJF0ppJ3wNc+Lso9pQ1mOoY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jqfmimjy; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-41adf155cffso9049355e9.2
        for <linux-omap@vger.kernel.org>; Wed, 24 Apr 2024 03:08:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713953298; x=1714558098; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=hWKDax4TuNvBE1FyIl8irPm+6EhpYQ3vGRHf4jX8q2k=;
        b=jqfmimjyh6Ph85Ik1D42j92UKFDe+J8sCm3BwsLMho4z4kb4JO878CtrnSZANbAzaZ
         WNeZvgcnsJPFaC+BowwBDcbEIAXkawGnMA7D41FPCwfTiRgy+W6ZZQt6VQye4dEIYMX2
         dzuP3zveiqLBJ8ebmzeW/0f+WxmJdxyeOGHalVUUsP/jotgUwCzrKZ5kJT0+LI1OQ3cc
         sVVFkYxI1OgHO2nMaddsCH93J7pUPLc4NtDUJxDx8bfCVMmhhIuH0jVUsVhK5wQMPBPP
         oeZ+YoLZNnNElMEXwWM0onrXm0775179DKNWsNdF2WEnWxKjVc07MXmf5lpX5ocTvaqI
         M1rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713953298; x=1714558098;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hWKDax4TuNvBE1FyIl8irPm+6EhpYQ3vGRHf4jX8q2k=;
        b=G7jWDSmeDnGGPHL/KtfO/M1YyCphPsLj2vGeEc+kV1foSOYIWIe93/g+VOuAlOe9hC
         PiqBdcV9RUkKeHdePlnRxApzqm1KjlHPN1dmZS0n+wR6mmI1ENQlnK6dISl/GVMG+KFR
         ggfKIptHPu2A3yOz5l/W05X8RUcp+gcK00K/V75UcSKP2MdWx7yaffzJyMUosuG+gttp
         nA9797/BnSBkeE7/Q48/EjPH8xoR/3mItiqXlCyDGy+LcSOAvDf+6WoAFKAl0ifOshM6
         Wcqp0d6fZMuT4htyB40wQDgX8kte3brxGt2IzlFXmnU//BsojItidYDBSONhN2QLvAwL
         oFnA==
X-Forwarded-Encrypted: i=1; AJvYcCUgWPIfTw3kHRLRWarCEzsPUjk6+PxGtFyjlDzzvVU/tEIz3cP5XXnz9leGMxLRya/NAVGRXLE+icDQT5a2H+NldfznVEFm6jpQpQ==
X-Gm-Message-State: AOJu0YzJODkVzNg6awL9zWhBxBOXFR7PVFvG6MOBfylLwl26oAmkS5RC
	I+GU9uRmTJtpqmosgjUEWTGa4fSbG1HBtZHUUMF++VMylhTq8eqAXzQxtd7Xhoo=
X-Google-Smtp-Source: AGHT+IF77S0eO7Dutrp6EQMSf6hVu3p2iJBEOx/XxaPtob8SJQvhDdTvZkjJjS4pcN8hkeXUmu2lXw==
X-Received: by 2002:a05:600c:45c6:b0:41a:a521:9699 with SMTP id s6-20020a05600c45c600b0041aa5219699mr1556544wmo.4.1713953297960;
        Wed, 24 Apr 2024 03:08:17 -0700 (PDT)
Received: from aspen.lan (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
        by smtp.gmail.com with ESMTPSA id jg3-20020a05600ca00300b0041affdeeb99sm1634085wmb.39.2024.04.24.03.08.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Apr 2024 03:08:17 -0700 (PDT)
Date: Wed, 24 Apr 2024 11:08:15 +0100
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
	linux-omap@vger.kernel.org,
	Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>
Subject: Re: [PATCH v2 19/19] const_structs.checkpatch: add lcd_ops
Message-ID: <20240424100815.GE1567803@aspen.lan>
References: <20240424-video-backlight-lcd-ops-v2-0-1aaa82b07bc6@kernel.org>
 <20240424-video-backlight-lcd-ops-v2-19-1aaa82b07bc6@kernel.org>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240424-video-backlight-lcd-ops-v2-19-1aaa82b07bc6@kernel.org>

On Wed, Apr 24, 2024 at 08:33:45AM +0200, Krzysztof Kozlowski wrote:
> 'struct lcd_ops' is not modified by core code.
>
> Suggested-by: Thomas Weiﬂschuh <linux@weissschuh.net>
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>


Daniel.


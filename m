Return-Path: <linux-omap+bounces-2509-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AF8079B5729
	for <lists+linux-omap@lfdr.de>; Wed, 30 Oct 2024 00:44:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6F3D12848B1
	for <lists+linux-omap@lfdr.de>; Tue, 29 Oct 2024 23:44:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1398920BB4E;
	Tue, 29 Oct 2024 23:44:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="PFiC9ELJ"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBEBC20B1FB
	for <linux-omap@vger.kernel.org>; Tue, 29 Oct 2024 23:44:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730245448; cv=none; b=Yct/cip9HlDGZ4v331+5T/GITh8A+mq7MBYubQqBMSShqYoEyXe0y6I24QXNNMsCTtf9hXdqc7SsYPelPQrdJPdGDt43rdwNkX5/EiKWfv9xXIUzE1HX69TdY9KxkHEjT5qnBR5TZ5Tc+T6ZEcMhVtU+qQrJEZjMsSVbBIeDKW8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730245448; c=relaxed/simple;
	bh=ysyVo0n5FvDl2lFjAzreUSoTNfvC5B1zkPO87Gt5vhE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=ssRtx3XWmTUGKM+4KgJ23pGFrekI56ir8wkWUTFAUg0ni35UvzBDZxIFLU/Hmp0w8A2w2/sSLBgQpoKuxupMvsdAxVKwLbl++XfJ3+UBodJrjYN/3a/wkqIM4nEQKWfnRrNq0qStl0Sn1OZyWSz2UNqugPSIk2YZRdvTVxdBXyA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=PFiC9ELJ; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-7ea7ad1e01fso279263a12.0
        for <linux-omap@vger.kernel.org>; Tue, 29 Oct 2024 16:44:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1730245446; x=1730850246; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=igJJeog43E/zfN61FrtJEPhQv110hxetbVpL1KXxqXE=;
        b=PFiC9ELJgfL+AzOwg1D1Nj9y1beHINUc6koJEFFonmoCnH/BaeZSUY86c6Lay5RZDr
         HAzpm2qzpD4iZ3QByEXSYAUamynmePIgSQO3O5I041JA/jj5N6vp/72//g9ZrDlb3GuQ
         KKetea6TPb1XL0CQF+2eFgk4shR1Gm5JvoGXkFoV+YpFg/HwnZZfNUz3p3iipQdHCvvJ
         HH+DyDYMjWFKaq/muKAdVRgp1vOvIVevw5++Wh/u6Z6yTr3O04QXb+hFXqyJW34ZsqR4
         hy2sm2hTAkTJf55szXxfLQYMMyKEpOIbKTj5BseDK79qVNWW+mJkZoWdYfI1Stv6IifG
         Gezg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730245446; x=1730850246;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=igJJeog43E/zfN61FrtJEPhQv110hxetbVpL1KXxqXE=;
        b=qhwJXfg6mnn25C1p7AK/J7Ip3px4MfTUscc/Grq4dPCSziucSb4sOSdF5cr1jAcy7x
         /0FWn1X8sP3GQJ4TQ5uMY4sIjIdQsxKCgGcDgbRRhSvQ3wXE80xPwIspISmG76rZl3RJ
         hCbO6/eYnfAo/DlC2kr74EPq6G5hhHlP3k89HDUeJHtLUJPUxlTXt9Ad960JWHZiPqyj
         WDbzu98UW4VhyZqoj9UZJwnq8ZvvkirJlAZ+hXV+fYJtLN6PpIPzM/SuNncnSdCah8y3
         /vhcWbw5pXtVffRJUKNkyprQO6eylpXPYJ84xFhwrVYLCp5h218GRsJbzUj+FNHXwScj
         TTZQ==
X-Forwarded-Encrypted: i=1; AJvYcCU+gO9kb7AkTCpjTD7p5yiOO4HAgm00uZhKUijjjiCiT9mUeVPno5oVmS3oSUAWh0PrrumiSmJLTH3z@vger.kernel.org
X-Gm-Message-State: AOJu0YyoX29dgGfcdu8o/5KSHsbnIWQD0IQcrGkk0IhzeXYBOC3iKYIS
	rHPf3TbKdZgoPxiAxOPNBdEZ2IEJPx0xyaxsC9XjV39EPFmD8T+bvBobk5s4nHc=
X-Google-Smtp-Source: AGHT+IEtGLy8A0+FtzyHgXO/orCTN0LXYfjYWute/5tFYb2ns9hvuTiQzl4BZqgnmD2XcibkujilHw==
X-Received: by 2002:a05:6a20:6a10:b0:1d4:f7e9:172a with SMTP id adf61e73a8af0-1db7ff61c9dmr597015637.23.1730245446276;
        Tue, 29 Oct 2024 16:44:06 -0700 (PDT)
Received: from localhost ([97.126.177.194])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7205791dde3sm8167490b3a.29.2024.10.29.16.44.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Oct 2024 16:44:05 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: tony@atomide.com, robh@kernel.org, krzk+dt@kernel.org, 
 conor+dt@kernel.org, linux-omap@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Roger Quadros <rogerq@kernel.org>, 
 Aaro Koskinen <aaro.koskinen@iki.fi>, 
 Andreas Kemnade <andreas@kemnade.info>
Cc: kernel test robot <lkp@intel.com>
In-Reply-To: <20241025164622.431146-1-andreas@kemnade.info>
References: <20241025164622.431146-1-andreas@kemnade.info>
Subject: Re: [PATCH] ARM: dts: ti/omap: dra7: fix redundant clock divider
 definition
Message-Id: <173024544474.1258780.10487507771077792076.b4-ty@baylibre.com>
Date: Tue, 29 Oct 2024 16:44:04 -0700
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-cb14d


On Fri, 25 Oct 2024 18:46:22 +0200, Andreas Kemnade wrote:
> Clock specifies ti,dividers as well as ti,max-div. That is in this case
> redundant and not allowed by schema. Both specify possible dividers of
> 1 or 2. Remove redundant definition.
> 
> 

Applied, thanks!

[1/1] ARM: dts: ti/omap: dra7: fix redundant clock divider definition
      commit: d0bdd8bb7f35a2b4434a3ef665f9cfc3aba886c7

Best regards,
-- 
Kevin Hilman <khilman@baylibre.com>



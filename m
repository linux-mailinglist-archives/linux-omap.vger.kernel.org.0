Return-Path: <linux-omap+bounces-5478-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B1CBED21A17
	for <lists+linux-omap@lfdr.de>; Wed, 14 Jan 2026 23:40:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2B09830C4DE6
	for <lists+linux-omap@lfdr.de>; Wed, 14 Jan 2026 22:35:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 917933B530A;
	Wed, 14 Jan 2026 22:35:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="eMXZ2HAb"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F1B7355024
	for <linux-omap@vger.kernel.org>; Wed, 14 Jan 2026 22:34:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768430099; cv=none; b=AJ+Hg4yJxu7ntwG4OFPFFvD8+e7KmRn+zloF1JUN9LyuTq3m7Efc4mNeSDl6hnfKe2IfiEOCP1TAunOCLfEKqWLwdmSJ3ByF8PwCGDD3AzD8Z41Onamzez1mBMol3MEWTtyPsIPScSJmuxFrnF3V9S2yVfk0qjIsOVuVPC7sJW8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768430099; c=relaxed/simple;
	bh=EYJQkC3et4NWoDLKxXE9/Y3cP8J+4A1mfoi2Yh3t7Ao=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Rb6NHCquaXWOPuiJL24kJq+8WOG6i4Im4hVf2p3wgQIkGiRk8OpAcSiz+DliP4zUoxSwmRwhwNF5cKlO0FMHm9+yTnBaNlT/YxG/jQrVk3EntcJ/Dri2vQEnuwTSU/eidh2mL+/toGHTT1kXYu9ft3dNhiSFm3jXs3INqo7LwFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=eMXZ2HAb; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-7f216280242so511238b3a.1
        for <linux-omap@vger.kernel.org>; Wed, 14 Jan 2026 14:34:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1768430090; x=1769034890; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F13Qm7TgxMiPviQmHt+xP5v+NAbLWrPExXjm23CEPGM=;
        b=eMXZ2HAbGDCWRtaSIFj+oHEoLe0dLjMadbchS19jmafxlj79Ju/HKkLpPcHQJHciI0
         R9LrDaNmtYx/Asi8RIUBDZDefGRLdnjVzSvH1vJZJuYSQXg49GSunCyKd58oer1WBR4E
         dsAdK3pUCot/k385lMU4tkx4a1zBN+bIr+oeAoqSctD/k4+pjUrh8OJS2mLl1nc1IK6Q
         9+T3x3ikFfAxQcVqXjX4+E349bZnvtoaW+zGnMhhd3IPdlNpK61oqpqCJcmb0WLvTr8j
         FYUmoxBvG3nh8zqvsb1AHXDqYvN9qnf2SQ0ltVbTEC/i3IhOE1G4fO9DN0W8JICSY1/U
         u5fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768430090; x=1769034890;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=F13Qm7TgxMiPviQmHt+xP5v+NAbLWrPExXjm23CEPGM=;
        b=jIzJSPWGdTkeHjc8PUY2toW5MyGyCihu35HPmy0NhdIlzdylAoT1RMlD1kiDBBYx5Q
         Gy0PBN4LI0xV572KFM4aTEZgxSYo1+8syHZ66+ZDoNsiZwpZsmPG1KDQLzssDFl826vJ
         KJ8GC98HKRawSRwguq5oh6BouaD70LuwGY7WKZMbZ6MlpXe8yRUq+W3qz7sro7Iq/iKm
         Ax8X/x4u+vHMZE+e8oTGKqDzOKRZ0tENsV5x1HstOW3JCkdKearj25rZSrf0Z6WZoI/0
         IJSPOgZlHhdThbxHAoMu3MZBQlNC8VKjpGU8KRsqXtBD/abYDHG9jGGjdD+m+liIY40a
         eKAg==
X-Gm-Message-State: AOJu0Yy8mEc+PgSrRlYiGDBpY3ANrIWoX/nI0rN/TRET4rLiJFkx5df0
	BkcG2Z+IphLl8NaV2Ul6GnaW88r4PApZaCFOcpaDngkgOYRHq89oRHUG0g5tkDq44sk=
X-Gm-Gg: AY/fxX4JGavgdk/06MPlsY4lFoW3GFZowGGPFAPuQi8OXlfOl00rxDmILZEhKQlBfZ8
	TuPcnoEWs3z4SwLopXuniu2xmmjyWWQt3Nslb07ftstBGY+o7D5Iw96kWhKdAkoEj5i36OIztZh
	nmGITSwaSp5ZNZ4X20rekovoj0qAnMeGUAh33397W1d315iINWSlcBuXrRU5sTG8JzMU41tuAIJ
	1e+maI0OnrVX9h0TcMukp1YY6XoHTkmvtHqasrNfZsByIElg939CDQhbZK7HCwlBTYCw/fiByvh
	Kb6eP4yaonpiv8q8QzhuxeU3UHD3XBdNY1SCLCJOcF1qzwas+hl0jO+9LirsS7rGV8hYKuRpqdB
	kYk1S7VdzlLNxr185kPc+zbDZ77nhgcY4zd9+5aovohzEtM5nNznxANO3hEVak2QVsXnnpOgqzu
	MHg2j8coN7v3FNABr1WYM=
X-Received: by 2002:a05:6a00:810:b0:7e8:3fcb:bc4a with SMTP id d2e1a72fcca58-81f8f10b08fmr867741b3a.31.1768430090366;
        Wed, 14 Jan 2026 14:34:50 -0800 (PST)
Received: from localhost ([71.212.208.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-81f8e64b7b8sm529270b3a.33.2026.01.14.14.34.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jan 2026 14:34:49 -0800 (PST)
From: Kevin Hilman <khilman@baylibre.com>
To: Aaro Koskinen <aaro.koskinen@iki.fi>, 
 Andreas Kemnade <andreas@kemnade.info>, Roger Quadros <rogerq@kernel.org>, 
 Tony Lindgren <tony@atomide.com>, Johan Hovold <johan@kernel.org>
Cc: linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org
In-Reply-To: <20251219110119.23507-1-johan@kernel.org>
References: <20251219110119.23507-1-johan@kernel.org>
Subject: Re: [PATCH] bus: omap-ocp2scp: fix OF populate on driver rebind
Message-Id: <176843008938.3580410.12257045683463470692.b4-ty@baylibre.com>
Date: Wed, 14 Jan 2026 14:34:49 -0800
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-a6db3


On Fri, 19 Dec 2025 12:01:19 +0100, Johan Hovold wrote:
> Since commit c6e126de43e7 ("of: Keep track of populated platform
> devices") child devices will not be created by of_platform_populate()
> if the devices had previously been deregistered individually so that the
> OF_POPULATED flag is still set in the corresponding OF nodes.
> 
> Switch to using of_platform_depopulate() instead of open coding so that
> the child devices are created if the driver is rebound.
> 
> [...]

Applied, thanks!

[1/1] bus: omap-ocp2scp: fix OF populate on driver rebind
      commit: 5eb63e9bb65d88abde647ced50fe6ad40c11de1a

Best regards,
-- 
Kevin Hilman <khilman@baylibre.com>



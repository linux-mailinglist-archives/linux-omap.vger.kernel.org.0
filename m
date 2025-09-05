Return-Path: <linux-omap+bounces-4591-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EFD07B466A0
	for <lists+linux-omap@lfdr.de>; Sat,  6 Sep 2025 00:23:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CA3171CC1D17
	for <lists+linux-omap@lfdr.de>; Fri,  5 Sep 2025 22:23:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F024229E11E;
	Fri,  5 Sep 2025 22:22:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="VverU1BD"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7131292936
	for <linux-omap@vger.kernel.org>; Fri,  5 Sep 2025 22:22:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757110940; cv=none; b=p0f9biKuOyWy6SZFGmf/zaKMgFB4LM3CUk6YTyRJJ4Lgh8olhQAc7W0nmGb61dwl5HrZAFgGE4V+Tk7NZ18sls/3irZrX9MYTc4NifahjMvcc9hplX/KqvR3NevZLiY8uhYfXNUOUSIopfI5V3Qx2QFqACMYTEF2RYCt2LI93rE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757110940; c=relaxed/simple;
	bh=4usknWEddfoi3Fas3Wgvr8wktFDBvKA4BChkoL+6ZII=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=AjOKwgsgxI6ytFtS4zuWqPwUdVe9Y7fDK54/n7GntS1grFNYD0iPx7egOCK97hr/Wh06KMK2JS6ZgeVJ2ewNO04U+eZacQcrzKaj+b+MX2nw4ZA0WkRKgmswBj+yerSgq44ybwKbCb2oD7NYQeuz+51WFchSPGX/+BUxkgeB1K8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=VverU1BD; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-32b6132e51dso2013637a91.0
        for <linux-omap@vger.kernel.org>; Fri, 05 Sep 2025 15:22:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1757110938; x=1757715738; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ajXrw2kXWcvaLXXTxcLJ0XN71Q9IM46eyqVaC58AnZw=;
        b=VverU1BDJnvUX8bN3NHzQpdocZt2adzhSN+Nvj1kEQXpwEUoHb4s2Hk+f7B5dHQqS5
         XoPbhSV21MPrHBEdHIM/V5iesW00YhsTgyw9MieXwtusEfh1olRTdulr5Hp4w73sXBcG
         GF1AhUNx5hqhohVjD7cby+al96I1HI6Vhfnu9q7rSg9r7KOSGPl+G73lb1WGO9sTER14
         c6TGeuRbmmnohho1kEj9+WQAzqgJWn4Ni9UUGOAVPRPzTkWGEEI558IErMThyfbMAOXe
         HH3uxcSDX/L+nwx+q8O1WK1R+WC822ophD21v5O72qmlihLfPN9K3x4sqqL8i0XpKNIi
         IuUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757110938; x=1757715738;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ajXrw2kXWcvaLXXTxcLJ0XN71Q9IM46eyqVaC58AnZw=;
        b=AiCvsBru4AyX1QgD4R2jV3Z9qSCzHrVzDA7jYo0khYRBo7+Ci70kVX7Jpzjczelg6O
         XcNZevNpBCx7Bek7FMmw92Gs0Jj3O83zuPvheIZCXTV30Ext5+bsddMQgdhRvToHPdST
         B9/WVOq7sChqAaw4IW+mJk4IYPXGmIqfEI8Au7CzdwOyVgHmeoZrTkgZkgOvW3JrZFLq
         Wljrsj2EPkkN/YZ+ZZ3/ZjMQ0ZDHpQ0z+WaVqWL7R1bz48pGYXkH/9LRCLCoU8u9qT9A
         coNl7EJofY5TKql895M4hskOZxINtJiLbxpdcsKteWE5+Jl0lE+dQtXcxW/8RLl1yV4O
         MVzA==
X-Forwarded-Encrypted: i=1; AJvYcCXU+VKofVNzV6br8x2++c55BalhcH+OCS/crY3mHm7EOwKkuL0mgGjYiwcarkFo9p9KKF2/JH9CnC43@vger.kernel.org
X-Gm-Message-State: AOJu0YwG7Bx6x5BTTYgwTE8dShjDa1//kKO0wbW6RObK4e8hYNa9eHmQ
	+39a52kdXzKQd+YKnADNoIsyRPBy4JKmXbOpdzjsFYQPl8q9xqTR0VZhGG5CEopn0Es=
X-Gm-Gg: ASbGncu+R+w3iaA8SY7q74ePFIaX3lopbYjJwXdaUJv34OIh+yRUmeVEMXkU0RaOckY
	HvLrmpbd+XQ4lS6+uw72YmSX7oSwAr5QZn+WICIHV8Yz11cWCvRwV1i3jvfkH2f1xd6sUPOQTBV
	pmrJ9hHJjAectxAk+x/UpvctqHQ0WKEJWepvbJGoezoBaR7R1n0Aj4jpOmhzSy4quSxX3D0peHy
	R5NfobHWd6Po7hRaBxOVpUfBLrvBTYcfiW07cXOvyHmEl1JOtN8M3ns7YfqNAqzovOhRUcQJoUt
	0N46d3p18WTTvcvrkF7/yPMO3O0Zd5W8AULN65zr40rOOw0x8QmczgRkDwsNrWRjWpwPIxe/VrA
	AgTP30tnExPFhm62KtZje
X-Google-Smtp-Source: AGHT+IEvDKPFc4gicRV4XwsSMT0l8afEt7vdoanp91e0aTRQHmWzkYtjOcm3TMm9WB4qrIiHEdmjxA==
X-Received: by 2002:a17:90b:3f8f:b0:32b:9d3c:13b3 with SMTP id 98e67ed59e1d1-32d43f60f43mr501790a91.18.1757110938006;
        Fri, 05 Sep 2025 15:22:18 -0700 (PDT)
Received: from localhost ([71.212.208.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7722a2af911sm22510696b3a.23.2025.09.05.15.22.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Sep 2025 15:22:17 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: tony@atomide.com, robh@kernel.org, 
 Jihed Chaibi <jihed.chaibi.dev@gmail.com>
Cc: uri.mashiach@compulab.co.il, krzk+dt@kernel.org, conor+dt@kernel.org, 
 linux-omap@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, shuah@kernel.org
In-Reply-To: <20250830215957.285694-1-jihed.chaibi.dev@gmail.com>
References: <20250830215957.285694-1-jihed.chaibi.dev@gmail.com>
Subject: Re: [PATCH] ARM: dts: omap: am335x-cm-t335: Remove unused mcasp
 num-serializer property
Message-Id: <175711093712.666031.7805837780140276251.b4-ty@baylibre.com>
Date: Fri, 05 Sep 2025 15:22:17 -0700
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3-dev-d7477


On Sat, 30 Aug 2025 23:59:57 +0200, Jihed Chaibi wrote:
> The dtbs_check validation for am335x-cm-t335.dtb flags an error
> for an unevaluated 'num-serializer' property in the mcasp0 node.
> 
> This property is obsolete; it is not defined in the davinci-mcasp-audio
> schema and is not used by the corresponding (or any) driver.
> 
> Remove this unused property to fix the schema validation warning.
> 
> [...]

Applied, thanks!

[1/1] ARM: dts: omap: am335x-cm-t335: Remove unused mcasp num-serializer property
      commit: 27322753c8b913fba05250e7b5abb1da31e6ed23

Best regards,
-- 
Kevin Hilman <khilman@baylibre.com>



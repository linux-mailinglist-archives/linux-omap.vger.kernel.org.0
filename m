Return-Path: <linux-omap+bounces-4584-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id AE992B4668E
	for <lists+linux-omap@lfdr.de>; Sat,  6 Sep 2025 00:22:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 70E79561617
	for <lists+linux-omap@lfdr.de>; Fri,  5 Sep 2025 22:22:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9433128505C;
	Fri,  5 Sep 2025 22:22:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="Icf5Av4c"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A9FA27AC35
	for <linux-omap@vger.kernel.org>; Fri,  5 Sep 2025 22:22:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757110933; cv=none; b=sJ194mSxLm+NWl/jYgP1cTKCUHR5OeFdCHeP3HmzsRE6kdbUh4VK+xZYZtf9k2+KmEdo8VD9ZX0qHC4QQGZEIGF34l5VWYkOvL7h5s853BXuIspRG2qbMOnJOy5ifBUNmTSJG1VfVdbODBJeKy5RP1oPaC7seBEuPZMHAuSPoi4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757110933; c=relaxed/simple;
	bh=0bc6X9lasc3Dgouopm68uZKL9O0T820hdWUqYskkHBI=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=ZIj1yTLH3QtOjR/X8QsRJAvTEvvg5tv1EAnWXzQG2OsetmxrZvWes6ywItxHcAsjb1Rzc8MkKCNdV81GyhFqiZTcG8A+78TgHm2XOrw7B3cG+7oEFndE4AmP36d/egiKCRdXg5Bf4hCfeUvr3MuZbQwNGHtt+km1Pjz4OWrCaD8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=Icf5Av4c; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-b49c1c130c9so1802425a12.0
        for <linux-omap@vger.kernel.org>; Fri, 05 Sep 2025 15:22:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1757110931; x=1757715731; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SOkRZw86+PUG/uFynPEf2qCkjPKg3bHXnCqaNk5Joig=;
        b=Icf5Av4cfnlaZ/9eJfQfjpwZBh7clFjBvtlY6b4ZuFuuCXVhgJ94oyh46OSONmNkk3
         zZK/Sg3i14WLKw++WPJmpAe8jt5Peh1i41xEyAk8WrJFrCoUJQ5Hfk6yezswKHqD1TlI
         2x4X+njWfco2ebtuBzOTO7Zn9BvmCL9dY8fUuhGRrh62HqwsmOYzFSZooMGTIHCsBaPV
         rI6ywTlQvy01eeOomzW0omjqyQQhsfwq+u/yInj1h07IE7LFoQvXthjdSW4dcXn2Lxvs
         HGn3RQMLc8FANmUYP096+B627Xgsl5rkli61n4b41wRe5VP+dVrNQSL+gxFP0At3rfEA
         uePQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757110931; x=1757715731;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SOkRZw86+PUG/uFynPEf2qCkjPKg3bHXnCqaNk5Joig=;
        b=pXYCEhnmG8qBxY0Hifyf22Gg5qt/ZurSallDRul/r1iE2Mb697j/tib3Vztjecm1sL
         JD+WdtOAtvWMSmN/SefxTZ6hOD680dZoOAQgQohpv12CENbrXkJsBFaUTCgRJ4wmTXZP
         cv/qpJRzkztJr1IjfaOc4xooA+FH8rqgg5fcIymSN8YM5ARALG8OKt6wrql0iy6jpJwU
         vQpYum1gpRAErZi1XOkNo5DktM888/pXrQpSvBaQcT6vbKwkEjTZru0UxPyPaqzkOm89
         KVlADkYVgXknRRtc/ebOZL/MiuPk55RiqWRv/lYN0B7DrH7jCiLe+DxQFurR7IyiZ5Qg
         ij0Q==
X-Forwarded-Encrypted: i=1; AJvYcCWXLphWw1hYjF2orAE5x0pK2RAeeOYVECQ+ARKxs1CQefwmAk6ZW6/u0aCOnNntnwtlNJ/R09JoKu7w@vger.kernel.org
X-Gm-Message-State: AOJu0YzI+Tyc8rRxNwbv2HVVcEomnK3tx7cRYyOvZOira5cQl9RtxGIt
	ikaucgeZ0BeHBe6oA7BdcBHU3oxtUbnjB9rTrd8fNgmDBM8pVklPAW4kMrglCPstxm4=
X-Gm-Gg: ASbGncvtGe29xAg50ypSSc/SM0qsZJ6AXC+d3lqTA2LlZKZq2Mpx6rFDbpd8BX9wFig
	HWqmYWfST97jVcvekz9LRODfsxqdvUPrYj7Z63arjyHmwxY3jKAU//IcZ6r4Rasx4uOk4/hP5No
	x29ShegSStjgZmSrLrQN3Iab0m9AeIqBxPt/8Bh/AeL+SMWYEbGjqviO9UmcTcwsHCN2/TV9J8B
	93AcehXs26kVtSEZXgQuI9eoBnKZkESXdiPsUyI/7hRxBwaRzk89piwEMa5JNvCfGmKIMM0lQv3
	9Hofy8tehUN8tFED6/5DHmGWg+9A1wpHBnhtzAE/2IaKCAtahbsrzUXMaM49zDFaF+h8Pf+wDu5
	lgZ4m9o5ejLD7APeFp2dOMyq5/RPj1aE=
X-Google-Smtp-Source: AGHT+IEymXQXFLBMg4vgdQqHVKloKPw02WcKpLxBw3Dc3FZxTNE5+JD0FsUK3rBu+92NffbaYsX8tQ==
X-Received: by 2002:a17:902:d2c7:b0:249:1440:59a6 with SMTP id d9443c01a7336-25170c44d22mr2423685ad.33.1757110930726;
        Fri, 05 Sep 2025 15:22:10 -0700 (PDT)
Received: from localhost ([71.212.208.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-24a92f89809sm183819685ad.2.2025.09.05.15.22.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Sep 2025 15:22:10 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: Tony Lindgren <tony@atomide.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, linux-omap@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20250717142212.92333-2-krzysztof.kozlowski@linaro.org>
References: <20250717142212.92333-2-krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH] ARM: dts: ti: omap4: Use generic "ethernet" as node
 name
Message-Id: <175711092981.666031.9611010303714828103.b4-ty@baylibre.com>
Date: Fri, 05 Sep 2025 15:22:09 -0700
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3-dev-d7477


On Thu, 17 Jul 2025 16:22:13 +0200, Krzysztof Kozlowski wrote:
> Common name for Ethernet controllers is "ethernet", not "eth", also
> recommended by Devicetree specification in "Generic Names
> Recommendation".  Verified lack of impact using dtx_diff.
> 
> 

Applied, thanks!

[1/1] ARM: dts: ti: omap4: Use generic "ethernet" as node name
      commit: 7c3e113ef09d474c4b076c42f1264c4fa78d1dc8

Best regards,
-- 
Kevin Hilman <khilman@baylibre.com>



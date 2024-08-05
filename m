Return-Path: <linux-omap+bounces-1841-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E9530948169
	for <lists+linux-omap@lfdr.de>; Mon,  5 Aug 2024 20:10:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A59AA28E050
	for <lists+linux-omap@lfdr.de>; Mon,  5 Aug 2024 18:10:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 52679165F09;
	Mon,  5 Aug 2024 18:08:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="SSCs4lzn"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5105C15F3E8
	for <linux-omap@vger.kernel.org>; Mon,  5 Aug 2024 18:08:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722881303; cv=none; b=k2R5LRew27zmU51a97TZ/T5Ee7VVqZPDoaN936gqbkCLZ/GviCmuZy1vfPSo/PKZ+IMLBk4jP84BN9MJF9SqW5pMygGLAarKOhZg6ed1HjYQJhO5ZCwAy0cdBCW1cpEhnNTRAbUPxE9ODwIqRczlKgw/l9sYnRhfsutwKTEq9To=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722881303; c=relaxed/simple;
	bh=ex9sBU8+XcVlEm6Hd9Dn0bMTj3eYGBPFMvK5O/6QpcM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=uQc4SllHIu6cO6TQq4L6QpfhaXaWjWM+gw3nebltq6wu7tR1+YAkFmqTdoAfXbXSxTRXMPkfSzkx5UH/ar1SIAdL1amzgphu9eddPBBQeCt/hXnadCf6zBB8n4sitvDItPjPo/mtxMnHMreruJhDjsch1nlkVQgbJIeK/NgcEUI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=SSCs4lzn; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-70d1c655141so8016892b3a.1
        for <linux-omap@vger.kernel.org>; Mon, 05 Aug 2024 11:08:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1722881301; x=1723486101; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lCzUM1rBigdBY+gC/XBYAT7dRPZ12RALycpgAtuA5TM=;
        b=SSCs4lznCXOCiTc2k3tcr4WsAZAtSZ0zymBQbA/WjDQyuSySycL8FKgL3hpwr4gY13
         IaV4SpcDRC99xjJCfMaierFOxZdnc/nSSHBKUzutoIxyxm+PoMh2uFNKOZ9BRLBjpUUr
         SW5TSIIrA9KM5dC16dH/zafiezglGBptP8w980csHgBzkkTY03NMMdAihyfAAgou0PYB
         VIl/NMHnHBerbBFb2jab0eNDgjf7PQDmaKPQomj3HS2oUBHdm0QfSDqKxR9S43jPQDQ8
         3CoA1KsTW7rOwIwMNsNvN3bzqKJ28Q54SGs6z9FlK13cTgizxxa6x6SkjhdFuid+PBfW
         u7EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722881301; x=1723486101;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lCzUM1rBigdBY+gC/XBYAT7dRPZ12RALycpgAtuA5TM=;
        b=akVq8Y3B0GVQZErJZ6ICZcadf3P/5jlExyDU+JluHQ3NEuRrsZCk3ggVTFVy23JoDa
         tNlRkZkDbZJRyobZacBeDC9f+fdQzHB3RmVZMyZJ791P7DiodnqG3AjCaRQeQZZt3Kh7
         ic76I1797FuXqlORW7sJgUOmllAqelGl0dMiOUceGp+oI/9VaR07kp71+oOe3Vxzo2Fw
         Ztye84KkdvxH3om/McU5Zb8T+GCNllCyihui7sc9cbJV0z/5OOvlFrcGs1e10d9vWN+9
         ot0YicWCnYXHf5MpDsBN2oqa/Rvn5undJc4xLN03H4mf27buBiJFTD27jPCZjFeD8SWY
         0UJQ==
X-Forwarded-Encrypted: i=1; AJvYcCUTnCkOv9mWep8iJGQzwBUyVx8GOw+s6JkgzuR+NMVov9GvRiucVXlEXa4I5A/TH3X2f2vrb9uZYcmCBqHKBWzpRTkdjKjx095hUQ==
X-Gm-Message-State: AOJu0YwILlZQlU+DFMFHcLz2uN3euPXJHZUf3+4kT32rnZBa9DzC1oKo
	QyozkZAAIKLuLchK+aGGHMaVWTSIdajfHHXslfQTkPN0kCCjBbqnKPdom4FR7RQ=
X-Google-Smtp-Source: AGHT+IHapSxScv2hAxzYbUrvZzDgqNHTuyG79pbGtSxB0f6I8HdmyxGYQhsQh3jQYYr8CQUoAAQ7gw==
X-Received: by 2002:a05:6a20:430d:b0:1c1:61a9:de65 with SMTP id adf61e73a8af0-1c6995510f2mr15157373637.9.1722881300731;
        Mon, 05 Aug 2024 11:08:20 -0700 (PDT)
Received: from localhost ([71.212.170.185])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7106ed151basm5669445b3a.169.2024.08.05.11.08.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Aug 2024 11:08:20 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: tony@atomide.com, linux-omap@vger.kernel.org, 
 "Sicelo A. Mhlongo" <absicsz@gmail.com>
Cc: maemo-leste@lists.dyne.org, robh@kernel.org, krzk+dt@kernel.org, 
 conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20240722113137.3240847-1-absicsz@gmail.com>
References: <20240722113137.3240847-1-absicsz@gmail.com>
Subject: Re: [PATCH] ARM: dts: omap3-n900: correct the accelerometer
 orientation
Message-Id: <172288129992.415194.13472157516748911125.b4-ty@baylibre.com>
Date: Mon, 05 Aug 2024 11:08:19 -0700
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.1


On Mon, 22 Jul 2024 13:31:11 +0200, Sicelo A. Mhlongo wrote:
> Negate the values reported for the accelerometer z-axis in order to
> match Documentation/devicetree/bindings/iio/mount-matrix.txt.
> 
> Fixes: 14a213dcb004 ("ARM: dts: n900: use iio driver for accelerometer")
> 
> 

Applied, thanks!

[1/1] ARM: dts: omap3-n900: correct the accelerometer orientation
      commit: 5062d9c0cbbc202e495e9b20f147f64ef5cc2897

Best regards,
-- 
Kevin Hilman <khilman@baylibre.com>



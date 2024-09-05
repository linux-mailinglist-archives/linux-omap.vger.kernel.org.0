Return-Path: <linux-omap+bounces-2114-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DC9596CB93
	for <lists+linux-omap@lfdr.de>; Thu,  5 Sep 2024 02:12:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0B12928272B
	for <lists+linux-omap@lfdr.de>; Thu,  5 Sep 2024 00:12:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E3C438C;
	Thu,  5 Sep 2024 00:12:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="s688LAOM"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CBEF28E7
	for <linux-omap@vger.kernel.org>; Thu,  5 Sep 2024 00:12:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725495136; cv=none; b=rTAQUEG+EYsB5pzYhyunZEGR4Aeas1wD9YlxsPcoFvK6ZMTEBc+pbKfbO2JKvv4jbRHM+LhVOzesAfXo6x9DGsrHx4AWO203Oe/hK3Xy/s+d6sADLs7P8idzj6vydVwuW/JndoQTwh/cNDLkMqE5G1CTzl3VLesG+jNXaeXP0f8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725495136; c=relaxed/simple;
	bh=emGmIZ03zq62j95PePX5TcKFPaJk+yLNAWOTXw3+VXI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=et49EX7ks4vDi2pDKgEQke6uAMK7LecqKckhovNySD1Qke3hr3n628nIbfO08CIuS6tvCmLfzJER4Z1txGpCOGPZnk/HfVrKhRyUIsjhVS59tFgxubL1HzRD1YVJplm1Xi+torfX4itTkWRuqUsmT8iOOi/O5ndyNYCRtwn2i2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=s688LAOM; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-2d87a1f0791so103818a91.2
        for <linux-omap@vger.kernel.org>; Wed, 04 Sep 2024 17:12:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1725495134; x=1726099934; darn=vger.kernel.org;
        h=mime-version:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to;
        bh=wL4u12NV1VQuj60Ffym57Y1XbUkuHQYZgv+GZJbTtq4=;
        b=s688LAOMOmcvUZWm2oooVhEoisHHrtwb2Zn9YEuvb26nACFR52NXujxLUfAKNqpkt0
         FLAIqJ1HMz9VJckDCE4Gz1QSEOHgHLXNlBeQ/7R/BborDLUXEZiDaQ8UcAX5YN9z+HBj
         PH8qajCKdD6PqpvlQ1lOoOxWfUYxGFkH9oxci3UfhWFtdaZEX0bsV5LxqFwnwQdAdsEC
         FZLvgiykhUAWE3YIpvdnYtIpESS4Q7EtbmSKaItChtyGKsGf/qm0i1qdfMk2cI0C3Mq5
         oeIgCBSDXt1ELRsoaHi9yfW0tkE4PqEBWI9fvl6ypiGAYtQA5eUOoxZ+Ur432HjBwP2W
         CvUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725495134; x=1726099934;
        h=mime-version:message-id:date:subject:cc:to:from:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wL4u12NV1VQuj60Ffym57Y1XbUkuHQYZgv+GZJbTtq4=;
        b=NOqvENN8rLdb/dACPRQa7vaqQ4YTpU+3Mcf77mU30BRJrnJoCP8xy5NKxJvir0L18y
         vkrbzOfthqMRH341OQo1vVJ8au4xEkTWCYtsTZHaXsgyLh8tjE7PNHaXBtJaxxVv95ZZ
         hDktfK/EHFZh6CTbwL61QTe3gBzR1CUm+I3F0rDebQruORfXRFl8Oh0kja85+hCCWQT6
         d/XyEcbEgjOYqX0OJxoZU5/oGi2R1vk4HfGanNm6NGF40OCWMswK/ZYK1WqGersGCLPf
         IQyDQT+VX+cJ0nO7gE3ChsKTaqMY+eyM5TAc51gpW8pUHJXY6QAgkLYYhodHEguXQjdK
         Cang==
X-Gm-Message-State: AOJu0YwLZeA+lQTxqwN16ApNFXFEDViC2oRj7rLBkR9QUvugijP3F/av
	2u5ekTYkJWYntr+Q9nUBFMJk5HBSFI4o6NjQvUpSd2JJ7aD7EA6iT0Zi2F1Wuz4=
X-Google-Smtp-Source: AGHT+IHRgKHREGcL6/nlj6uLIcHmZYxDODMrBfRBQC3/5avKjZqTeGkLfatx8jlHlDO1tmkfRdykTA==
X-Received: by 2002:a17:90a:c244:b0:2c8:e888:26a2 with SMTP id 98e67ed59e1d1-2d89728c0c5mr14359797a91.13.1725495133815;
        Wed, 04 Sep 2024 17:12:13 -0700 (PDT)
Received: from localhost ([71.212.170.185])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2d8ace66f14sm8981201a91.20.2024.09.04.17.12.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Sep 2024 17:12:13 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: soc@kernel.org
Cc: linux-omap@vger.kernel.org
Subject: [GIT PULL] ARM: OMAP1/2: misc SoC updates for v6.12
Date: Wed, 04 Sep 2024 17:12:13 -0700
Message-ID: <7h8qw7arhe.fsf@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

The following changes since commit 8400291e289ee6b2bf9779ff1c83a291501f017b:

  Linux 6.11-rc1 (2024-07-28 14:19:55 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/khilman/linux-omap.git tags/omap-for-v6.12/soc-signed

for you to fetch changes up to 1934b0c82e980df4c9503315bed4e178905cc1d8:

  ARM: OMAP1: Remove unused declarations in arch/arm/mach-omap1/pm.h (2024-08-20 12:18:12 -0700)

----------------------------------------------------------------
ARM: OMAP1/2: misc SoC updates for v6.12

----------------------------------------------------------------
Andy Shevchenko (1):
      ARM: omap2: Switch to use kmemdup_array()

Dr. David Alan Gilbert (1):
      ARM: omap1: Remove unused struct 'dma_link_info'

Gaosheng Cui (1):
      ARM: OMAP1: Remove unused declarations in arch/arm/mach-omap1/pm.h

 arch/arm/mach-omap1/omap-dma.c    | 13 -------------
 arch/arm/mach-omap1/pm.h          |  4 ----
 arch/arm/mach-omap2/omap_device.c |  2 +-
 3 files changed, 1 insertion(+), 18 deletions(-)


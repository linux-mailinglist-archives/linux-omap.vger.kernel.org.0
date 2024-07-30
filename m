Return-Path: <linux-omap+bounces-1804-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 85CF094207F
	for <lists+linux-omap@lfdr.de>; Tue, 30 Jul 2024 21:23:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3E3A1285AAB
	for <lists+linux-omap@lfdr.de>; Tue, 30 Jul 2024 19:23:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D1B38189B94;
	Tue, 30 Jul 2024 19:23:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="m1QRnDFg"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13B701AA3C5
	for <linux-omap@vger.kernel.org>; Tue, 30 Jul 2024 19:23:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722367427; cv=none; b=pEo0MAl26PjFy0dMyrWoWVV25ROnCqoEuAihEce7L0Y9Z/hubBOVB5sFHOFVPJ3a7xUbWes++rdPZoWhBNQU872QeXJRHPkRyHwk7RMILGJp9AuGIVPpCGsrbZxF81Ry8RzBac/XnzlTyqtfqKMIpMRnbiqCMdOVvwCPMBulUsE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722367427; c=relaxed/simple;
	bh=ywD7NAh6KztdqBTXp+joB8iFT7cg+Tr6qVvfRePjkpo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=HUD3A1gnD4JRgEd2pQ2GGY5n3konHPAarQY8v/XHVPQDHgB+PET7U8wXFt0Z6kiVkF8iFLPxCAFRmMdTM/8jApv4euQUvNGZOlayJTzptsfJ5plyfkP0YBxXDGhJR9O5MFUUOE79t3bFud+dne91HifmRN1qyUZQ90dNf/yL/Tw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=m1QRnDFg; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-70ef732ff95so1572562b3a.0
        for <linux-omap@vger.kernel.org>; Tue, 30 Jul 2024 12:23:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1722367425; x=1722972225; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e71klws5Yps0dVVf1IgYLiVR9KRW2buzAYZBLwWi2Wo=;
        b=m1QRnDFgUVYNYZXTMyMQdvKdijT5VNXm6gWVSKNlWigpPHQ6n0sO80DhlcQE9FDO4g
         0/Dhh3YtgW/vzDzYm4T5LVVSGz/78adq43OTVVrFvt4W7AZ2y4pm3ETg6jtT2K7LvrpN
         kiPXyb3XSXruSO3yJvMqDOZa51duPEiIt9TxUCTT8PMe47K7Ve6ALOE+brVwspXHKwHR
         XhoowUiyvQUqJ5EM3pq8AeX/1Ok4gsKLy87I323JoRnPU/Ro601WFp8m2P0ZA4Szzv9j
         gJRgOB1zgJtfpxf0mQqU+lvWHgTgRvLEFcspdrtVk1OMw32nQ/m8ZCsqmGiTbZPYR/XS
         O1uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722367425; x=1722972225;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=e71klws5Yps0dVVf1IgYLiVR9KRW2buzAYZBLwWi2Wo=;
        b=qd03gwgbyVDl6kePOuQNAD6UC4pEJEkbhbfteOKwRYqVbEu6tSZT+/UjBgsiHixb21
         4lGijgHrlBXOwVMwZqY6N0xu1axUQ9Auqvx7jRBZEQYXs8xoGYoi4pSNtrJuvYbrHjhS
         2mjAITC9WpjlGbdDeTlLsppMQ4dY6S8n8r6U2M8Pf82bUp+RrCupfUgzhxDS1zw/MOz2
         1ay189LxqpbvqEThn/VkXoa6F5weX5T39rD4otD44/JMfXO6wUmTT4XN5J1niHEE6/Br
         LQIr2j9w7NVVzCRcabkInNaZrmQxn6gKlRo3RwJyykYbvqFItuv77c47RJQeXxn0WRSS
         8F/g==
X-Forwarded-Encrypted: i=1; AJvYcCW9vl3YeSIdR5cK46wF0y6c8S4NxyQcAaDK54yDyQSv0QTieFYPzBUtBFXf31WfIQWzZbODuqfAjDG1kNzSQUWPl/CKosbGZfd7Fg==
X-Gm-Message-State: AOJu0YyAX1oP0vu5Qnyhuakr2K8Ul5eWDfMbuHjjW28Vdq0CnXPGsFDL
	AuRXNJvg1ULcV6LEav+34VNny/v2yo1RKD/eJ7YdEcmTd1y95do5/NKS7fN25xQ=
X-Google-Smtp-Source: AGHT+IFDoPfNE4Op1+lZqfCz2C8U5W5aaYCRcvMWF8wQdUf9Vs9MSi0qpIEMVczXxDdpiIG7Mv1Uig==
X-Received: by 2002:a05:6a21:6d8e:b0:1c4:9f31:ac9e with SMTP id adf61e73a8af0-1c4a13afbffmr12065123637.42.1722367425412;
        Tue, 30 Jul 2024 12:23:45 -0700 (PDT)
Received: from localhost (75-172-120-197.tukw.qwest.net. [75.172.120.197])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70ead81270bsm8740908b3a.107.2024.07.30.12.23.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jul 2024 12:23:45 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: tony@atomide.com, s.hemer@phytec.de, linux-omap@vger.kernel.org, 
 Dominik Haller <d.haller@phytec.de>
Cc: upstream@phytec.de
In-Reply-To: <20240730092353.10209-1-d.haller@phytec.de>
References: <20240730092353.10209-1-d.haller@phytec.de>
Subject: Re: [PATCH v2 1/2] ARM: dts: ti: omap: am335x-regor: Fix RS485
 settings
Message-Id: <172236742474.2211098.1838214226300693563.b4-ty@baylibre.com>
Date: Tue, 30 Jul 2024 12:23:44 -0700
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.0


On Tue, 30 Jul 2024 11:23:52 +0200, Dominik Haller wrote:
> RTS pin seems to have inverted behavior on am335x, other than expected
> with default "rs485-rts-active-high" (instead of low on idle, high on send,
> it is the opposite). Transceiver datasheet also suggests a pulldown.
> Add includes to pin definitions that are used.
> 
> 

Applied, thanks!

[1/2] ARM: dts: ti: omap: am335x-regor: Fix RS485 settings
      commit: e589ec9847e5fc78a219a85b740599ae115b6431
[2/2] ARM: dts: ti: omap: am335x-wega: Fix audio clock provider
      commit: 6a410ff5359610779908cf94f18f9f39281ecabd

Best regards,
-- 
Kevin Hilman <khilman@baylibre.com>



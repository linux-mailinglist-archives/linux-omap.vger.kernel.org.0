Return-Path: <linux-omap+bounces-5333-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 820E4CF57E4
	for <lists+linux-omap@lfdr.de>; Mon, 05 Jan 2026 21:17:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 16F0730F8A00
	for <lists+linux-omap@lfdr.de>; Mon,  5 Jan 2026 20:16:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F7C3346AFB;
	Mon,  5 Jan 2026 20:16:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="lrM8fBzg"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99024253932
	for <linux-omap@vger.kernel.org>; Mon,  5 Jan 2026 20:16:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767644163; cv=none; b=iep/6AVwTzK+aUR0KUjP9rUYmJRajbUorTFCZAsmiz+I6P2XrshkYc7pH/v09ZlA/vyPyhyb4+FWuz+2aw12Qkhvy9N+IscnFCExJ468j63I1yuJDTzfMBI5ACN6vq7vVS7rlYiDUHcwD/nselZopXVOslnJoBrIWgG97+MoAls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767644163; c=relaxed/simple;
	bh=GlAGxw60887sAVyf2r1P8gsyI6ZDN3dTFENSsBfZeRc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=FgJfdb3Dd8+E0nA/A2MHVIzyuZ9y3pvuZXxhEpWS6egZ5LLwsLhyLciVA3rYRnMf+pNTbqPrYT1M3gDf5BHOTVjSskx3G/VNN0JDUpeZv/3Pc2IO7x7C7iihvccK7TKFwAuOh1mg0/ZcVLq24phTR6oS9A2NXo5stMYPFlakQzY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=lrM8fBzg; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-7b75e366866so146529b3a.2
        for <linux-omap@vger.kernel.org>; Mon, 05 Jan 2026 12:16:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1767644160; x=1768248960; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kZSZZ0NcHIRuKJcx81Mh2IbInHyMIKpBF4sIqpjFN2E=;
        b=lrM8fBzg0mP8LvWc99uydqSvaZKMe4TXqcPBJR+PmMydhJ+yCbBV7QnqioTGPSF1E9
         TQCBvW7cWFDkNzTfhG97dzIdVZjBm4AfuNyNH/k35DtfEROf9AXXSDfWQtypagGgeGvW
         D43xqTTuHnd8qnepmJiii4BdsnFTEe1vFTOvYc8qberS/TIunFh27eXdSz1oegL/zdzj
         YZ6klUjPsTjrxnGJjz6zz0sf0jkFBn7wk4i8Ok87gP+0BR29g0peMO7tD4s7BNVZ/Rx0
         DZT2xEnzpZhw/MN2X4d62gjHJr0Y2kDiKgn9iMiYBvYwi7hVfm4BDXdrlXYorCs9eE+J
         4xMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767644160; x=1768248960;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kZSZZ0NcHIRuKJcx81Mh2IbInHyMIKpBF4sIqpjFN2E=;
        b=jpwwO8neA08XBWtWcO3+9gqYMvgrNk/YY2z/3NTyGFXpLv4/pFwvlOB0JjrLdHzVgt
         7Fs9KSSHai50wIFRjpr8FSvoLfYlqJ+xIiu0a19Z/6sQ0gYDbwij0pTmz7kp+WB7qEvq
         ArEkzIJEZBcAQ7pZIpAWOd55qxWvjDQZzjdLzXII7mzFo3yd03A8SxwpHFahtKfPNj44
         zPWpZTP5sEtfeWRH33neSumEJd5NJBrRfmA8UiEKDzve5IK2vV0E8jqsob2wPHFX3lY3
         poevSOv6SRg3O/ID75or59J9OIPERM+DRFEaBWE4DmzMMK3cDzu5f+tYoCJEEo6hEugp
         GO6w==
X-Forwarded-Encrypted: i=1; AJvYcCXKg9LfW0ZaZksTFWe9AI+PsVLgPLSrnW5R1d7vzd3MjS6gZ+e6OPxbPADQrJ1zMm+RSErDNbScBdA1@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4YB+8AGKad8DF0BP0G5M8LjPGo1Ynsyrke+fOf4oEKV8I9A/6
	kBP196Hl8+f/ZPpwF860m7FpGe9oTJKRV86ZJ2jHAwSMVcYsQC8jy1JAaTqKTvWjWys=
X-Gm-Gg: AY/fxX6/j2yLX4x6lL2AFgSNPHTv0PdXUBGNp+Cwpx6x0fcDu1WSs7CTSOVC7SK7VAz
	pPnAm2ASXK8+t+NA5dgyFWdqO9MJwXyCEy0Oyugqfxg6zoFAEi06uFf5zaL8t0u471kHljiAm8l
	sLp5xXoqDx4iMYEx7pDse8Y0CSab9u5DAkDChEpCSUYSobEoa6+7enGM3N4dY0f44dpTtRqt/oE
	QMR08OCXzijqxcJYmrcduQEzSyMFkYFZVKmSl8+q9MT+DkCTEwigj998YF6Xko4n8vPsBpHA5Gq
	dESZqxZfc9mVF/KjZprGGmEX7cmBlvVlLXvIfM9WUtYhmDkbjRiVFK0TDaKkdvJ1yDpOWJllAw6
	sZUxUIxXC8tvx8EUMfT4SK+TTKYsxggDjx16Ayx2CWnx65q4N4U7QupfM3NCswh116KEe7EyB5m
	wSgV3sftTp
X-Google-Smtp-Source: AGHT+IEHjjpFYWzc2Wq0J1oiLBzWArBe54oz0YlfSqH0xF0+40Jt6FjOez5/4L3fR9/GkZAWrm4pOQ==
X-Received: by 2002:a05:6a00:430b:b0:7e8:43f5:bd59 with SMTP id d2e1a72fcca58-81880383fddmr689923b3a.69.1767644160587;
        Mon, 05 Jan 2026 12:16:00 -0800 (PST)
Received: from localhost ([71.212.208.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-819c5302c61sm22217b3a.42.2026.01.05.12.15.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jan 2026 12:16:00 -0800 (PST)
From: Kevin Hilman <khilman@baylibre.com>
To: aaro.koskinen@iki.fi, andreas@kemnade.info, rogerq@kernel.org, 
 tony@atomide.com, linux@armlinux.org.uk, Wentao Liang <vulab@iscas.ac.cn>
Cc: linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org, 
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
In-Reply-To: <20251217142122.1861292-1-vulab@iscas.ac.cn>
References: <20251217142122.1861292-1-vulab@iscas.ac.cn>
Subject: Re: [PATCH] ARM: omap2: Fix reference count leaks in
 omap_control_init()
Message-Id: <176764415968.2561401.11587667060875531413.b4-ty@baylibre.com>
Date: Mon, 05 Jan 2026 12:15:59 -0800
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-a6db3


On Wed, 17 Dec 2025 14:21:22 +0000, Wentao Liang wrote:
> The of_get_child_by_name() function increments the reference count
> of child nodes, causing multiple reference leaks in omap_control_init():
> 
> 1. scm_conf node never released in normal/error paths
> 2. clocks node leak when checking existence
> 3. Missing scm_conf release before np in error paths
> 
> [...]

Applied, thanks!

[1/1] ARM: omap2: Fix reference count leaks in omap_control_init()
      commit: 93a04ab480c8bbcb7d9004be139c538c8a0c1bc8

Best regards,
-- 
Kevin Hilman <khilman@baylibre.com>



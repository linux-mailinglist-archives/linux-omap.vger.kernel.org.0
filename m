Return-Path: <linux-omap+bounces-3269-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F6D0A29DEE
	for <lists+linux-omap@lfdr.de>; Thu,  6 Feb 2025 01:37:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D4C623A789D
	for <lists+linux-omap@lfdr.de>; Thu,  6 Feb 2025 00:37:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A5B3D381C4;
	Thu,  6 Feb 2025 00:37:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="DXpsq6Mq"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3810125DF
	for <linux-omap@vger.kernel.org>; Thu,  6 Feb 2025 00:37:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738802235; cv=none; b=Na+mjKsAqAVEUL/nJMSdEROCPjqmQF2QApT5SBQQvO9DQ335fxW1fYrGwojaYJdQpNbOuGrtpCmUt2p/LtK1h7j7YgZPv3PISSz8ObT2OVNxE95BS81C+npXj0JgJAEYiESZY/nwK9vDvESpF3Fokr8bfz3SSR/SGOlhpf9qCA0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738802235; c=relaxed/simple;
	bh=P0D3iFt86T6gv8bKDwIO7YaaHu/XrhniOHkLnRI8OJk=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=FXPeirwRUCWqmJW4y2bginqW9SQDvTHKznxnChbeVYyCKo8veF+S0wi+/vFO34FDuFXBDNZT0/iRphEZl+EMDfzvpRzmuvOAcNs5OjGfmEEmYrAqv0E3dmUz46zIEZuhC3vOizVM64Q+c0RnI1ZHkGNH41pR0+9gyHz5jSjVgb4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=DXpsq6Mq; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-21f0b5d6c6eso5170585ad.0
        for <linux-omap@vger.kernel.org>; Wed, 05 Feb 2025 16:37:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1738802233; x=1739407033; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Rr0c0Mekj/MPUNG/MPU9ertPQwQ2z0j9RQ9nWUa25XQ=;
        b=DXpsq6MqZlECFwdNodOlWBlSZ90L6jZSRDrpoDQ4Uk62lt3Esn3ACWnNhp2R/HFrRX
         JoLHNJo2wzZ0CQ5zqs1pvbvznFDlg+bHuuqCrrvjjCrtHJReCeDMXoDZvxrUMm3X4bBp
         VH6HdYD4djpCcq92zGgftI5qnjAp0vBE31KlAQVaK5/dcI2xPX40TdCtplswKHn083yw
         fmswWbp6SasFrULnDzKeFvAoxK2P1rkTvZ71wKy2+mDiFZg3dvZBzjQRf5/lYYNMHGnX
         KEaV/LIfpF0FFd7bQ5L0UouLa7Q4r3GHbWxVeUWsW23y5xkiw28dbBgcZ2W44lgiV8Ja
         42qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738802233; x=1739407033;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Rr0c0Mekj/MPUNG/MPU9ertPQwQ2z0j9RQ9nWUa25XQ=;
        b=pUasBqgDkGDvqjDz1gqUrdFqlcrTeocA1KSoikq/Qj07giVhK+72iKCL8NrlVjUdVt
         a8g+ECq6PYy4SPaoiIFznhWUcZx3N9B8vWcCq6zL+0ICgw3gm9WdJAGLnMfj5p+xyJ3f
         kYLy+q0FHpX7otTC7841KTrIlxEQnKHLjGvfX15IkJfnS2XqY3H26qaOAQfTV4a2F1hg
         sEvAz9dk1wJKeDwPnJCyqp4TkecdV9kY339kWGF9PrN/NsjCNuvK5UN3RSZEaCyLcNQB
         Vc8hChRwZ/u7QxuGyLzS3XtHSm+BRMwqYiXRbfhhgAG7rRM9yeOjNi34yGXZXkm798Hq
         KAFg==
X-Forwarded-Encrypted: i=1; AJvYcCWzLy7VeJdV2iVQ5c92wNoNje3g5QTy44MfqZazBaYsoW4jVJBMJvftYwH4b2zY6/fgls5sN+rc68zq@vger.kernel.org
X-Gm-Message-State: AOJu0YxEPs1OcR05DZxsfOd/jrkcKSOzrqEYAbbeQOZtCGQvRQxWzTQR
	Rs8L8xhcs2/jXFJCUeEatdkfE4rdzV/+nCZ8NgUTJuIdqaT6m51XDh1G6wRL/lEznoz5SWBM2Ul
	U
X-Gm-Gg: ASbGncs7j98aKT228MPeQ/iGjpvWm6lihR1pC16iy+8Dc4p0r1BtioRR5dN6CxE7ysu
	SRPAjNx6KygW0iGjo+qOEUES5/8fC1/wu8NXvjORL1dkn96uxqlCV+6ANC10r1X3nUTrNaH8rEh
	YVDzOfC1NHHzxb7Z6SJUdqIv5v3Wcqt6w/p0pe73Yx9IgUJt1P67qgPfnDdPx9kmDm/XZaNA012
	+515apKIMVAcaeNG0VgmYdCkgZ2ZlTh5wm9cqkiO3ZGSmJOu999q5CfPi+yBFyz6oaf9X0rf9YA
	SSpRrddmwB+Uag==
X-Google-Smtp-Source: AGHT+IE/LzIHKJCWK+klnZk7QiidIC1M7t+1V4Yqlxs0v7unb8+7MKwR4ueUDiyVPVQQrQhsAjtmLg==
X-Received: by 2002:a17:902:ea06:b0:216:6be9:fd48 with SMTP id d9443c01a7336-21f2f1374b9mr23519265ad.3.1738802232844;
        Wed, 05 Feb 2025 16:37:12 -0800 (PST)
Received: from localhost ([97.126.182.119])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21f3687c9ccsm41755ad.189.2025.02.05.16.37.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Feb 2025 16:37:12 -0800 (PST)
From: Kevin Hilman <khilman@baylibre.com>
To: tony@atomide.com, robh@kernel.org, krzk+dt@kernel.org, 
 conor+dt@kernel.org, linux-omap@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, rogerq@kernel.org, aaro.koskinen@iki.fi, 
 Andreas Kemnade <andreas@kemnade.info>
In-Reply-To: <20241230195556.112118-1-andreas@kemnade.info>
References: <20241230195556.112118-1-andreas@kemnade.info>
Subject: Re: [PATCH] ARM: dts: ti/omap: omap4-serial: fix interrupts syntax
Message-Id: <173880223194.2488567.3049966264498351840.b4-ty@baylibre.com>
Date: Wed, 05 Feb 2025 16:37:11 -0800
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3-dev-94c79


On Mon, 30 Dec 2024 20:55:56 +0100, Andreas Kemnade wrote:
> Usually interrupts are overwritten in the board file to specify a
> mux-dependent dedicated wakeup irq, so there is interrupts and
> interrupts-extended property which is not allowed. That has generated a
> lot of noise during dts changes if just a phandle involved has randomly
> changed.
> 
> Avoid that mess by specifying interrupts-extended in the dtsi file.
> 
> [...]

Applied, thanks!

[1/1] ARM: dts: ti/omap: omap4-serial: fix interrupts syntax
      commit: 13203d24dd003206f58d570d19e2b515feca71c5

Best regards,
-- 
Kevin Hilman <khilman@baylibre.com>



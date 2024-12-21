Return-Path: <linux-omap+bounces-2878-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E3429FA160
	for <lists+linux-omap@lfdr.de>; Sat, 21 Dec 2024 16:28:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D5E5A164483
	for <lists+linux-omap@lfdr.de>; Sat, 21 Dec 2024 15:28:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B4D01FBC84;
	Sat, 21 Dec 2024 15:28:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W+DynyTZ"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 158ED1BCA0F;
	Sat, 21 Dec 2024 15:28:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734794891; cv=none; b=YNeH9DlrwvCevXCCrlxseur7GoHVg7PwhufXwDsFfc2T1IjHx3tYxAje9jf8y53cUy+0n1QmRsMiWCX282sprAcL9yVC1WVIVj0V+T7q3gqXgexKxIWMXB4p750Bgg4E5U9WOvJhnh8U0gERY+7UIB4pR+iM+/Tup05cp90FEuc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734794891; c=relaxed/simple;
	bh=BV079x7O6cKyfKzPx9emZyYcJRHoPMX3FNuiCbnmPdw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bX+WozH2yktff0Y4M7JcQLEyNHawV7SpT9RG6EmdoY4n06QQ6TWtLO/Gsxob3w/uAZyp1QlROxWQJIPSPI9RfkZaD6CpAuvr3qIiWrdpi196/QC6Q59MQUNRy2hVsZTrG4+Sxr20h4DZ6D5xV9kNCAelKIB1aGGfjJKYkZSGx6s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W+DynyTZ; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-43618283dedso28043915e9.3;
        Sat, 21 Dec 2024 07:28:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734794888; x=1735399688; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=M/GHzKpSDemqfkSwfp0eht4g8id8IOmCGwES2fh/rtY=;
        b=W+DynyTZZ8hDdYUK8nE0GaDVYXa+TvA8EtiTONYSosgpo7k+BRXtu3NQsCEU4ztYE0
         KcZ7n/NCBZsT0XzlulrScfwvdzkFjStcURI02O0EIaGzgzw6Zu6dVJloEn1bkigunHUK
         ViAiq5T0Fvy0JMGGxIGM1+sGlyLBKpu9oJM44+8+n/2D0KfNY5lzxQy0lzclrgB78of8
         0Mn3Tip/fnTpyR1zy42e+1WjCstHoQrP7xYe0MTfcVx+xeSfJJXMBlvx6uy9OrHckAsJ
         TrdXecQyr5SdbvosRVYrX0gY8OnoeK7pnk3K61UBZJPoL6YPDUi+3YBhDvGn7XxsdxzF
         GoVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734794888; x=1735399688;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=M/GHzKpSDemqfkSwfp0eht4g8id8IOmCGwES2fh/rtY=;
        b=MDcsO+hr3Bm9dLJ7y+ZPjuPNIrQoSJRqS8s6b64zuaHo0yo3vLR19Ld+F1u0g4I/bK
         1lRhkXJJDRYHvR7dUs7pp5NdfJjIr2y+UsTUu9ikdePoTJ/riULu90mXo791cA/zf5iy
         3lCzlaBocxLGmf6CwEis6vUa/j9TeES42tgJ2zG1Zlq18Un7tykndS4pCc4Wm/zztHvg
         XoSl37BSo/zLRrcSPQOX/mC7clR6x9UXALcjT7+uVVuoW6sOpnvju5KQquCMrJ7VsYfx
         cyPVXTFJVO7eYAVbKP0boXnwyit35/TeGYNqTMx2kEbIbYe/LDYEetX/LW6zPEGqqyNU
         IUkg==
X-Forwarded-Encrypted: i=1; AJvYcCXO54xc/VUXL5ALmuOwhzRSAwVPJcJ88SJOZx6OmnJmdJifsP32f3UCtu6vpNEIYOmqA1T/RFuxXz435w==@vger.kernel.org
X-Gm-Message-State: AOJu0YxEujq5zub8EuLHBgAadaqK2+5zcNcL4rKRVnjK6tJfwHM4lFd8
	BYz79m8uzeyrs2/1vBts+tHd/Dxqwqh8n/J/Kl3QgaDjtT69IYXw
X-Gm-Gg: ASbGncs3gULmCyr6RKkOdMbcW+iPC9D1WsElK63J889mgaAkZExmBa8v7P0s/eYIKnQ
	kQkM3SVE6e1oVk8k5zJf/bdTOZHgYPdqrwQm07SPads0O+kouGdcDm61iEZEU+RoTOM0K+gQ3Ku
	NRE3AIthUi+ZEgdz4Q+5mRTCowQ3mXzAiluXXUeI7WKJn32QYS3Rlbt8Zxbnb8QrDd2BsvY6UaX
	3Em8nOw8FSb920+NgnyJ6Lide0FIh/+h/J+y3GGXt+MzgilYO5ax5xMmMk65x+YH869NA==
X-Google-Smtp-Source: AGHT+IFIJvP55Olie/6A7NMFKvx6jVYZcdLne06ivQdO4pkNRmQZGTWC+v+PYs2VHYUj2he1OUhbcQ==
X-Received: by 2002:a05:6000:1ac6:b0:386:2ebe:7ac3 with SMTP id ffacd0b85a97d-38a22408fb1mr5042958f8f.56.1734794888167;
        Sat, 21 Dec 2024 07:28:08 -0800 (PST)
Received: from [192.168.1.10] ([95.43.220.235])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-43656b11495sm112033595e9.19.2024.12.21.07.28.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 21 Dec 2024 07:28:07 -0800 (PST)
Message-ID: <61a0c65e-386f-40d6-bc5f-f2b5a8d03cb5@gmail.com>
Date: Sat, 21 Dec 2024 17:28:06 +0200
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] Drivers: input: misc: Add driver touchscreen-buttons
 to support physically labeled buttons on touch screen surfaces
To: Carl Philipp Klemm <philipp@uvos.xyz>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-omap@vger.kernel.org, linux-input@vger.kernel.org, tony@atomide.com
References: <20201115194421.b08f1458bc383c38d74d9982@uvos.xyz>
Content-Language: en-GB
From: Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>
In-Reply-To: <20201115194421.b08f1458bc383c38d74d9982@uvos.xyz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,



On 15.11.20 г. 20:44 ч., Carl Philipp Klemm wrote:
> Adds a driver for supporting permanet, physically labeled, buttons on
> touchscreen surfaces. As are common on android phones designed with android 1.0
> to 2.3 in mind. The driver works by attaching to another input device and
> mirroring its events, while inserting key events and filtering for touches that
> land on the buttons. Buttons are arbitrary rectangles configurable via dts.
> 
> Signed-off-by: Carl Philipp Klemm <philipp@uvos.xyz>
> ---
> 
> Changes since v2:
> - Decrease the potential for memory leaks by migrating to devm_* where possible
> 
> ---
>   drivers/input/misc/Kconfig               |   8 +
>   drivers/input/misc/Makefile              |   1 +
>   drivers/input/misc/touchscreen-buttons.c | 587 +++++++++++++++++++++++
>   3 files changed, 596 insertions(+)
>   create mode 100644 drivers/input/misc/touchscreen-buttons.c
> 

Did that patch somehow went unnoticed?

Regards,
Ivo


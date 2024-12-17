Return-Path: <linux-omap+bounces-2847-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 086B49F5826
	for <lists+linux-omap@lfdr.de>; Tue, 17 Dec 2024 21:51:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 05DF6188E174
	for <lists+linux-omap@lfdr.de>; Tue, 17 Dec 2024 20:50:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A0DC1F9EDB;
	Tue, 17 Dec 2024 20:50:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hgDYRm9I"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BF531DA10C;
	Tue, 17 Dec 2024 20:50:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734468616; cv=none; b=Ih5dWIFy429zlr5C2fjpyzx7/RMG5p/FeS7xqaWQwZPn3KLYC2EfKa0qZAwNYJv5VVMfGPq4Zdrir0Sno1olQlYYdkCkAcOy2hxYm1mRG9Dr8wSAlu28X/J2Iqg8Lk7e7j0jgZrw5s8BV3iNxgPqBHCmRItpSzXkma1rnCUWjtk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734468616; c=relaxed/simple;
	bh=8m1uu6dElACABIGZiPzBIxUcw4xI4B4oIocQGZh/PqM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PRisutobV+V8sw0TbdCQ+t+XYUMVvEot0fFsgC5opvHl84OtcGGwKrZ3i+ik61YzjbBcx9pcPsL07ZW6VGChZtLjy2UXTc6L+nm4um8xZYRKf05sJdE3DKecbifVwKrNqy8lU18EjGIQhW3319fku4MeQ8X0P1p3iHuolXdvRZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hgDYRm9I; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-5d647d5df90so6802877a12.2;
        Tue, 17 Dec 2024 12:50:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734468613; x=1735073413; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=/a6bmmAK1d60gi0lU7uXwTo90xv1jBzpKHz+mz/zaDc=;
        b=hgDYRm9I+e8b7qEKwEV7FPOPxlHwfS5sipaHnNBeJ2ZIFdtWeXOgGsA1HIJUEH5GMh
         lN3kaPl2owVSMX3V+Cj++MMVNKLepGMHe4+QlefS/DccNUQHoXF90kKV+tsZoaCRojag
         qP7pg7dX290vjctXMg/Ch1fZ8kfwfYb98382VFS73Kzq0jIrXcHcP2qx1c7Zkzqqhejr
         mHNxbfm98ruTqk5+0gRQmHJxHQ0mZ3XIXFu897sS238VjrOPMRjqFVoto4Xfqub00xEw
         fvNgFspmiVqvNsKJs/pM6Bn0XorDGcHeHa/Z9AMzTaiyo8qER4VophOJ6k9TgK8jqKCi
         DrzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734468613; x=1735073413;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/a6bmmAK1d60gi0lU7uXwTo90xv1jBzpKHz+mz/zaDc=;
        b=qnSN05bpHpcWf+ipTi5TOrr+plycy2V8c2+OnjCn5QgKW2KJCnZ+FpEe6pNUUUiliw
         ixdYshwT+8Gq/yqz3ZQN7srZi8xEKw2P1XIJwI2nYITvLldbarwXTvXzpzRKRPt3UYQE
         xRQ5bZExDg0osp5fEC0mz/WCy1r047eJ6GDPlVGyWN2RIZz30jHcnK94eesNjNkkWlY+
         ZVUOWYdofjuhZt6yuH0e3svsVfXKNwcmBglL+pKkCwt7mCubjfPfp3VjMSMS5D69nNv5
         OKWkzPPn481sZKk3AkGqTLsXgn89xX1smfEe2N8TrOg23wKWvgE4lM4COPyRHKJuioZG
         ygGg==
X-Forwarded-Encrypted: i=1; AJvYcCVKI9odq6NT5bdOGVtiiyFqmVZYZk/l3pEbq4+Ctux+MLWGS1SRXb+MpDUs+HyMR7Emc+R6QvcL+fUm@vger.kernel.org, AJvYcCXjX0mhTRVQQIurEBhxCeVHg+f2aWru7NaSsVkzbDVyLvA+gQGMtSpuxr66HpDKu2lCgq2q/Eao@vger.kernel.org, AJvYcCXsfhu9AFPsdsB34Uc00aaZkH2xdBRiVhrjgWgaAYcUJZaBosFFeutVkC//76hMkZBqrsIfon8vsTbdCA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwlQY8qBBA2SJUloaxpMb+Cnu73AlBpYWCtFrAXDmRfIZ7cKIwp
	n1xN9KVFPxitn1A+BH/sMOHhYIVW5Vo+f0aWo8M9JUtUEfR5vTc1
X-Gm-Gg: ASbGncsud7jllwAu9xdJpUP2F5nnkyAbTzIg4KrooESJ2SkSHV2tMWW3xUtcTlTLsMH
	FW7/9Pve0mDr0/+cg/sRfDUxDE8eLbBg6scXBUQiARKScNNuIA2ofUWU482CM2AHvgYQHiCQWz8
	gls2/Qw1MzFBXJZ8pu0cNKL/+3qHqT55u61OyQ9aDlloUTzj/z0mcoYoU7I2u2m8FJPEOXtONbN
	lhNJLGu1bRAGrF7pKNM0pyAG7s8eQZHB5mWnjYmjY2cj6wu0pz43UAAEY97g9F98WrfPyLO61Vg
	82R7SPaoCXdnij1TrdTLfivVfIUUE6ms+VBVlZzoVZ3ZcZ/2KO0n0H6yB9MovmGWstXnf504jQX
	hsC6ip/XtUpbHiJbpTHT5/a34UJ75m70v5mPV2Np/
X-Google-Smtp-Source: AGHT+IFrGnbYVZur6boqTQBMzIPiDI2SUJgZMU9+r0drhWidyXw4Jljzq6Du5Oh54vIfn8sJEtL6TA==
X-Received: by 2002:a17:907:9705:b0:aab:a1a8:92bb with SMTP id a640c23a62f3a-aabf47121d3mr11470066b.9.1734468613139;
        Tue, 17 Dec 2024 12:50:13 -0800 (PST)
Received: from ?IPV6:2a02:3100:9da9:e800:6a:aae8:41e:b15c? (dynamic-2a02-3100-9da9-e800-006a-aae8-041e-b15c.310.pool.telefonica.de. [2a02:3100:9da9:e800:6a:aae8:41e:b15c])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-aab96068adfsm492607366b.63.2024.12.17.12.50.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Dec 2024 12:50:12 -0800 (PST)
Message-ID: <7f8d2b63-390d-4f7e-9ede-d28c7793538c@gmail.com>
Date: Tue, 17 Dec 2024 21:50:12 +0100
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 1/3] net: phy: add phy_disable_eee
To: Andrew Lunn <andrew@lunn.ch>
Cc: Tony Lindgren <tony@atomide.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Russell King - ARM Linux <linux@armlinux.org.uk>,
 Andrew Lunn <andrew+netdev@lunn.ch>, Paolo Abeni <pabeni@redhat.com>,
 Jakub Kicinski <kuba@kernel.org>, David Miller <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Simon Horman <horms@kernel.org>,
 linux-omap@vger.kernel.org,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>
References: <5139374e-7151-4d0d-8ba9-9ec3d9b52f67@gmail.com>
 <fd51738c-dcd6-4d61-b8c5-faa6ac0f1026@gmail.com>
 <35e1ded5-e33f-4ea4-ab16-c460da402822@lunn.ch>
Content-Language: en-US
From: Heiner Kallweit <hkallweit1@gmail.com>
Autocrypt: addr=hkallweit1@gmail.com; keydata=
 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
In-Reply-To: <35e1ded5-e33f-4ea4-ab16-c460da402822@lunn.ch>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 17.12.2024 11:43, Andrew Lunn wrote:
>> @@ -2071,6 +2071,7 @@ void phy_advertise_eee_all(struct phy_device *phydev);
>>  void phy_support_sym_pause(struct phy_device *phydev);
>>  void phy_support_asym_pause(struct phy_device *phydev);
>>  void phy_support_eee(struct phy_device *phydev);
>> +void phy_disable_eee(struct phy_device *phydev);
> 
> So we have three states:
> 
> MAC tells PHYLIB it does support EEE
> MAC tells PHYLIB it does not support EEE
> MAC says nothing.
> 
> Do we really want this?
> 
> For phylink, i think we have a nice new clean design and can say, if
> the MAC does not indicate it supports EEE, we turn it off in the
> PHY. For phylib, we have more of a mess, and there could be MACs
> actually doing EEE by default using default setting but with no user
> space control. Do we want to keep this, or should we say any MAC which
> does not call phy_support_eee() before phy_start() would have EEE
> disabled in the PHY?
> 
The case "MAC says nothing" isn't desirable. However, if we did what
you mention, we'd silently change the behavior of several drivers,
resulting in disabled EEE and higher power consumption.
I briefly grepped the kernel source for phy_start() and found about
70 drivers. Some of them have the phylib EEE call, and in some cases
like cpsw the MAC doesn't support EEE. But what remains is IMO too
many drivers where we'd change the behavior.

> 	Andrew

Heiner



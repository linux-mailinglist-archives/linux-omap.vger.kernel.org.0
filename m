Return-Path: <linux-omap+bounces-2853-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 934B39F5F05
	for <lists+linux-omap@lfdr.de>; Wed, 18 Dec 2024 08:02:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CD84216851A
	for <lists+linux-omap@lfdr.de>; Wed, 18 Dec 2024 07:01:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8646D1581F0;
	Wed, 18 Dec 2024 07:01:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V1ZUQzKK"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78E6145005;
	Wed, 18 Dec 2024 07:01:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734505307; cv=none; b=SaAxFn0v89mezRUo52wslkh9bGgoJzjAVL2pTQPHeIT2y70LFybrtL0TqVK+2uF7jg2stDB3s9cEE5bCrLPmVpxg7DyUWJdMd1gqOjQ0FyEQLCdcG4rQ8XYuPC3POEG5n0uI1F9ZDMgefTPaJae8S4xyxkfPw+Y+CwknoKrWPiw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734505307; c=relaxed/simple;
	bh=8eXBVnXurdTuZsN7l/54KDApfOyeG95twbHS9PqgQos=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=G6l1dua4uUBJXn/vwCABigZ4WHkFmVM4HNY+V/cTPHJkL8d/cySUxKjUbCiB+E2FrIsQOTgd6d8q5idyD+lLDU9Kzz/dt9w/p5urkg9AWp0sCfeEn2LDPDvQ2RGZg5khijwt+7ss8ApLdHpgY4B8gSktNLsyvW0uKlrzQdmzS5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V1ZUQzKK; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-5d3f65844deso10128377a12.0;
        Tue, 17 Dec 2024 23:01:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734505304; x=1735110104; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=JNIZmW4+sPsBWP1BNqFNvrEC05c3x+qKrZPcfPqWLRM=;
        b=V1ZUQzKKJLn8/JrvBRcqo6UyaFPAeyHNa/Ebv+RJOshxm0gBbA1aJmJHjyofzkadJ7
         XTTlcTD+kFyKpbPrGYEOWdEWOwGV5f9mYR5y6E+z7yXq/NZhduBDo75iCfCO02FwJHK0
         lqSG92yufrfVPvTHMrNQeIPzQl2MXf+EUzucgkeZtePjKlBzlGp9pmjKrWkgg48xuEWL
         KI/xx9I8NiTv5fbRhiwTeQXdN3dWDzPAo3rEXFtrwUiIJyT+08GkD11GfAQmUJ+SCGke
         5KXP0t4+bEeexDH0EfdhvjDUD4+pNWIbYCFzZgGXExiTYlwKtOlZJ/DHmMFuUigINJGa
         bVBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734505304; x=1735110104;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JNIZmW4+sPsBWP1BNqFNvrEC05c3x+qKrZPcfPqWLRM=;
        b=W6CtlNzI7GmOfNX18snUEwvxDYOI/SgnfXoz0pJG0YzKqJI6Zm5GeWjzvFtCRIB2na
         uA31mPnECdPnFrojPJ0V9MsXhAV8zG/PfBC3dfIM40Kfb7nfzKKrGU8lAzM0hdgGnRDP
         I92ZraCEY+hE425Mqy+jNhvmnYeKv+WZeY2Nse5fct1+DLGTHrLHA33OB/U27f3IMWY+
         YHSfriMD72/YG89qtpWTzPanmD6aXrxofN66/ilfiECv2+ok7mv4yNdToyKjhNE9XCHl
         lKwCD/Y+kM73rx6wiBcCUiQUuMyZHBquLMN0dfwBY5gHCGhvpZrJDDqLbbNm/UEvBP9z
         bK4g==
X-Forwarded-Encrypted: i=1; AJvYcCU+7dgHZNVsbCwcomiMDUeCm7/+ItfMOTIPlRlN24kDxRgRQl4l8fB3pEIs3jn4mlzSTe/u4YDHA8jm@vger.kernel.org, AJvYcCVWqOnRn1W9rXJr3TmrigUW75tui5cOQ21HvgHLPaT0x9Ng8q5+kdSAiQx7GRuuYhYZ9wZrNOe4@vger.kernel.org, AJvYcCWgrO+LfusmC9wLANawoq+mk7+N3boCUviJnvSaZQcSCSNO+7+nElECcBIGehIFYxsBp5lg6VKmEMiy+g==@vger.kernel.org
X-Gm-Message-State: AOJu0YzbQGVDCNyzc/iE7nkEYrzc1zfqOt7PSmOWl2xWqnbIM0LvvgXS
	0/PMqwqr2gDvobin6BBSb6lObZlJmz8NmbYGzo+NQwPjkXIwOjyg
X-Gm-Gg: ASbGnct1wKmC2cuWJLhU4PoZqDmij9At1bks43Zy/LM4HL0jGEyMh439Ax8GMEhQe6r
	sygwo7op/d1bJYviPsMeQBE776q7pPadE3EOVNf45gdhee1JOMODdDvRoxVCc92oAqNBppqiiq3
	3mYW2UkN5KIMWYk6GoxYvOe+Qtjew70S5BjmjyKF73p6txvOdjMHz3GY8WiH2LWLZdZgA207uCt
	GIEaXslX+PgFnq0LfpXFH23Q4c07M98NJ9fkQtPV/MlgPMj9BBjthk2OXw/8ZYInzCsq7vTU72S
	Pm2jORT65yg8XWaFr2aB/frrCdOscfLwrH3XFiUsfdePXF7kTQknGOp4F+VTMIf0ERC3X8fG4Fd
	r4zAsuYyjq5rDkCb8L6uaUDLKhhRDfz5lETwGI5xyrzLMpg==
X-Google-Smtp-Source: AGHT+IE/0DkKoSEm2CX6Xdm+66DT71x8C0s/CR05DI78SD6rzpWrEcjSpHcbGjGNaSJMXzscMoQcKQ==
X-Received: by 2002:a17:907:7817:b0:aa6:aa8a:9088 with SMTP id a640c23a62f3a-aabf48f72d8mr126784566b.41.1734505303390;
        Tue, 17 Dec 2024 23:01:43 -0800 (PST)
Received: from ?IPV6:2a02:3100:af42:2600:dc26:da5a:209:facc? (dynamic-2a02-3100-af42-2600-dc26-da5a-0209-facc.310.pool.telefonica.de. [2a02:3100:af42:2600:dc26:da5a:209:facc])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-aab963c54a0sm526400466b.181.2024.12.17.23.01.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Dec 2024 23:01:42 -0800 (PST)
Message-ID: <950a7738-1308-46ee-b913-018c51db76b8@gmail.com>
Date: Wed, 18 Dec 2024 08:01:40 +0100
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 1/3] net: phy: add phy_disable_eee
To: Andrew Lunn <andrew@lunn.ch>,
 Russell King - ARM Linux <linux@armlinux.org.uk>
Cc: Tony Lindgren <tony@atomide.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>,
 Paolo Abeni <pabeni@redhat.com>, Jakub Kicinski <kuba@kernel.org>,
 David Miller <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Simon Horman <horms@kernel.org>, linux-omap@vger.kernel.org,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>
References: <5139374e-7151-4d0d-8ba9-9ec3d9b52f67@gmail.com>
 <fd51738c-dcd6-4d61-b8c5-faa6ac0f1026@gmail.com>
 <35e1ded5-e33f-4ea4-ab16-c460da402822@lunn.ch>
 <7f8d2b63-390d-4f7e-9ede-d28c7793538c@gmail.com>
 <35cd4b23-06fe-4ac8-99f2-5eb59ff275a4@lunn.ch>
Content-Language: en-US
From: Heiner Kallweit <hkallweit1@gmail.com>
Autocrypt: addr=hkallweit1@gmail.com; keydata=
 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
In-Reply-To: <35cd4b23-06fe-4ac8-99f2-5eb59ff275a4@lunn.ch>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 17.12.2024 23:34, Andrew Lunn wrote:
> On Tue, Dec 17, 2024 at 09:50:12PM +0100, Heiner Kallweit wrote:
>> On 17.12.2024 11:43, Andrew Lunn wrote:
>>>> @@ -2071,6 +2071,7 @@ void phy_advertise_eee_all(struct phy_device *phydev);
>>>>  void phy_support_sym_pause(struct phy_device *phydev);
>>>>  void phy_support_asym_pause(struct phy_device *phydev);
>>>>  void phy_support_eee(struct phy_device *phydev);
>>>> +void phy_disable_eee(struct phy_device *phydev);
>>>
>>> So we have three states:
>>>
>>> MAC tells PHYLIB it does support EEE
>>> MAC tells PHYLIB it does not support EEE
>>> MAC says nothing.
>>>
>>> Do we really want this?
>>>
>>> For phylink, i think we have a nice new clean design and can say, if
>>> the MAC does not indicate it supports EEE, we turn it off in the
>>> PHY. For phylib, we have more of a mess, and there could be MACs
>>> actually doing EEE by default using default setting but with no user
>>> space control. Do we want to keep this, or should we say any MAC which
>>> does not call phy_support_eee() before phy_start() would have EEE
>>> disabled in the PHY?
>>>
>> The case "MAC says nothing" isn't desirable. However, if we did what
>> you mention, we'd silently change the behavior of several drivers,
>> resulting in disabled EEE and higher power consumption.
>> I briefly grepped the kernel source for phy_start() and found about
>> 70 drivers. Some of them have the phylib EEE call, and in some cases
>> like cpsw the MAC doesn't support EEE. But what remains is IMO too
>> many drivers where we'd change the behavior.
> 
> So for phylib, we keep with the three states. But phylink? Can we
> disable EEE when the MAC says nothing?
> 
Looking at patch 5 of Russell's series behavior doesn't change if
pl->mac_supports_eee is false. So I think he also goes with the three
states, at least initially, until all drivers using phylink have
implemented the new phylink ops. AFAICS this affects about 25 drivers.

> 	Andrew
Heiner


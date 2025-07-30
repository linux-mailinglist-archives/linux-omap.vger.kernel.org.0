Return-Path: <linux-omap+bounces-4166-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A75C2B168E7
	for <lists+linux-omap@lfdr.de>; Thu, 31 Jul 2025 00:10:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B3A275A4FC3
	for <lists+linux-omap@lfdr.de>; Wed, 30 Jul 2025 22:09:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7146D22B594;
	Wed, 30 Jul 2025 22:10:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="dFWQWdRj"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 014CD132103
	for <linux-omap@vger.kernel.org>; Wed, 30 Jul 2025 22:09:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753913402; cv=none; b=OcNFJOnhHOAWJMMt7RLMoVD91YMTkzKmccDKE97kBmLU9sPFnPquS7ME7Yayb72L0gp/rrUYvoqpct6gFOO3Kcm6aCZigdeEWyhBMQgs0OPp19IJ3a7cCqgySbe0mKA+mH3oiQSUNMuCC+SFA8raD4092030eS38C6iPgrEDmBA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753913402; c=relaxed/simple;
	bh=h5cJJQbHdQaTXKh51DQ5Re0YcAkiLbnVXJhRdDuB/C4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=kcbOvs0T5smNtKrGcDB3dcQ+NgHJCLV/yDNsTnN/cfha3yUdva0Cu+ISIvsA7LpJpdCv+8crZ1SlaXscclOMme0lOn/1jdUNu49cahF8I8Q9NnyFs9MYbqTCkcAE6Osm8aV0UUlPKg7JZHCFRMyqcL3gg2pIFztugs6ZEiskG+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=dFWQWdRj; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-76bc5e68e26so400649b3a.0
        for <linux-omap@vger.kernel.org>; Wed, 30 Jul 2025 15:09:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1753913399; x=1754518199; darn=vger.kernel.org;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=TNHleuSifX4SpZEBGO13RG2Nv3EISS0eVP1Y9ZTvpOg=;
        b=dFWQWdRjvGd1kNOV4eSNMoLq0Y3jxWegl6RAwDvvAdobAdQumcttctfvGlh6XA9QKN
         Zy7l8DL59b10HFvIkSB3qCK47/3eqMRdz8zGFOk+SmHknuXhdMZTzkyLEYKrTbqko3QK
         MUqn9HHayNRvW3a3MwCRMK5YTAB6zzFMj6xlsTYSrq+d5csOrKeEszxuDVeQ3sUwDtZm
         7nWg/Gk+SnUaxOgw6OmQ+STdkiWKoKTC7no3kdH0ihl0A9NGSA1ccFu33RiK4PdZ+o2p
         VF7CMAs1rvr+hEDzsZ8Goyzcd65IpnW9BIdfL23wf0uo5ZyE8snfPGQPa6th0wDX7f41
         BirQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753913399; x=1754518199;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TNHleuSifX4SpZEBGO13RG2Nv3EISS0eVP1Y9ZTvpOg=;
        b=i9hxwByYAv+w4focqfLf6IcA5ROEchNuKYHlu6Ktop3o9dPgIcRU1uH+JjfPJyMGFQ
         tzzmVivdiHEfBOq9Dme0aFi2nnzcv19l9Hp9CJwWnJ/FF0Jao0Yi11p9o9wCbcXKg40F
         xyLc/3gC4U+yppeDe4e4cHjPDM+H7bORDvFxBx0UaqWTZLZZFX0LyD9d1cxIpzz8uzuB
         HwzntkMebnDL0/stWE4lxtL0of6LjyUdsCXeyE9090S5qaza9lkrHfYOTCEq4JBh6WdB
         14ddt1o/oEoD7J/7HvLLIztur84RQu+dWr/HOwEkh6oO0GE83henj3A4sBO37LX/vrDi
         GkPA==
X-Gm-Message-State: AOJu0YwkoVCC+3fiooR2YrOkMWMrSIeHwuNUl8AUZV9CnUyglZaW7n+7
	a4YfSVv691uWXO7T9uEahxVFONLu7U2dD+8qT+GoocVWM16cG7xTIVxQNYSWDCclTzA=
X-Gm-Gg: ASbGncsJ3fwpoJgJXDkeYKdXvFUOMceqLpjFSZQ54onxnE3UDgkcVX/rlY5LKka0/En
	FoQ47o5XvkPMPoRSRyIYJ5JLbzcSvYzZq8agR2+lxSjvzT6XIr9Do5RfDewuVG0vKXQAOhWGKVU
	QohOJh8UyRg+8pNCoGKgdGSu0gW/jibeoPAxGjZ3I7BVCz9gBgwRkISGK29HP1M9SpNf06xSczm
	zyFtpzVu3+P/8S8fuL9QrRyHmnr3HaPhKdv4vuQv6WJJL6WPG3+D0z5um+FrARlq36L4JT9/KgD
	VeYLPvmtFuvY69BiMEIpONwWBTBNfRIHGvrPrRTATLOqto4ERXndWEcWs7lgGUrMa5nUUX22DMg
	4xH9ohoSX+G/mphKDkREY
X-Google-Smtp-Source: AGHT+IG2Jmy1RxV6oBn2xGkRgnttbrjqStwBdj8OoNSVMvlZtpFrHbZ+yOlxDoOXh/Si7e4z6KNvHw==
X-Received: by 2002:a05:6300:8054:b0:23d:c9d4:8634 with SMTP id adf61e73a8af0-23dc9d49682mr4388168637.16.1753913399278;
        Wed, 30 Jul 2025 15:09:59 -0700 (PDT)
Received: from localhost ([71.212.208.158])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b422bb18834sm42944a12.64.2025.07.30.15.09.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Jul 2025 15:09:58 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: Arnd Bergmann <arnd@arndb.de>, soc@lists.linux.dev
Cc: Linux-OMAP <linux-omap@vger.kernel.org>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [GIT PULL] soc: OMAP updates for v6.17
In-Reply-To: <42241d2a-bf66-4ef0-a083-b0d4f0c3f9b2@app.fastmail.com>
References: <7h34b4xcxb.fsf@baylibre.com>
 <42241d2a-bf66-4ef0-a083-b0d4f0c3f9b2@app.fastmail.com>
Date: Wed, 30 Jul 2025 15:09:58 -0700
Message-ID: <7hwm7pbaa1.fsf@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

"Arnd Bergmann" <arnd@arndb.de> writes:

> On Thu, Jul 10, 2025, at 17:50, Kevin Hilman wrote:
>> The following changes since commit 19272b37aa4f83ca52bdf9c16d5d81bdd1354494:
>>
>> ----------------------------------------------------------------
>> Kory Maincent (2):
>>       arm: omap2plus_defconfig: Enable TPS65219 regulator
>>       arm: multi_v7_defconfig: Enable TPS65219 regulator
>>
>> Li Jun (1):
>>       bus: del unnecessary init var
>
> Unfortunately these are changes that I really want in separate
> branches, for defconfig and drivers respectively.

OK, noted for the future.

> Since all three changes are trivial, I ended up cherry-picking
> the commits to where I want them. I hope that's ok with you,
> let me know if you need the stable commit IDs.

Yes, fine with me.  Thanks for the update.

Kevin


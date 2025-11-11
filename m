Return-Path: <linux-omap+bounces-4894-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A9F5C4E901
	for <lists+linux-omap@lfdr.de>; Tue, 11 Nov 2025 15:47:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 807B64F97FE
	for <lists+linux-omap@lfdr.de>; Tue, 11 Nov 2025 14:42:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0DF5D33EB13;
	Tue, 11 Nov 2025 14:39:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=resnulli-us.20230601.gappssmtp.com header.i=@resnulli-us.20230601.gappssmtp.com header.b="zydxsuLt"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FC512FF663
	for <linux-omap@vger.kernel.org>; Tue, 11 Nov 2025 14:39:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762871954; cv=none; b=ls1uydU0SardpzJ4ho4Jsnhgeg4TJOl5AqcP8UvHMnTLm5wTDNlcmS7H4A9EtWPvotnT9wz3BVFnnTO9tdpMHz2RmMGRalgYPXvIAJCdM/T3QHEg3x4ABtAN1AyGskz4QDfD9ne7bw3Zl6v4z/BzcbivaielBvbDjtCp8yiRuqM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762871954; c=relaxed/simple;
	bh=NDXnNMmrl03vXv9oqm07S6qgAhQq+R4B4/0FFECMY6s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ddJu2pkEoyYZif6FqqWFqZc7yeCQXSXPuUL0t497ZSgi7ZsnM0CLh1CGU3AO7MTmNcpA94ZLSC7D77IrZ/6sQ6MTAaV/o0tPGgh50oje4mSMQCa3Gby0wgD9ukptZ6hvRVnYb3DoE1JYF0aU+8oXMrTGKDN6V1K+0IEwwIlIoH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us; spf=none smtp.mailfrom=resnulli.us; dkim=pass (2048-bit key) header.d=resnulli-us.20230601.gappssmtp.com header.i=@resnulli-us.20230601.gappssmtp.com header.b=zydxsuLt; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=resnulli.us
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4775895d69cso22408065e9.0
        for <linux-omap@vger.kernel.org>; Tue, 11 Nov 2025 06:39:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli-us.20230601.gappssmtp.com; s=20230601; t=1762871950; x=1763476750; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=BbZiM31j3hF7yHeWrzWbDvWSfA60EWmb9ONaywmv4Bg=;
        b=zydxsuLtdh2kkOZQG/hKh2nTOHu/pOz5n8UTfDY3URMsOhxICjsTG9nQ2GLZjb95Dz
         CZFMM+qzmcwXfp9XBLYAiQAMGVp2kX3UOHTd5s1DFN56t7xvDh9SEgFHJvXCijUoZrvJ
         bzSkFRHZLz6RuthkjdZhi3oOMGjtqx7VpuAXLHStTMVM4jnCvPASd/Tmci22l0gvTc3F
         sOB1NQMSlBOnhuhMS1m8jpQ/dpfzIEfhkFImwhZhccLCymdcvZOc8TLFMytuBm3tQ/l2
         /9XN4p6DxjzUvl6S2yXBREJTbzAdyWMDr/8sxuQaQv8GowZWnIvwwY2ebplOB2EmM+zn
         WiaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762871950; x=1763476750;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BbZiM31j3hF7yHeWrzWbDvWSfA60EWmb9ONaywmv4Bg=;
        b=wScnNowW8LGVu/y4x/JQ7hJhITvKIRUkI0BowGsp/fZHW1XJkuCEOpqlRatku/Z+Xm
         GffmcazLGoJaZ4UtcdFCL439CgpPKr10xujFEHJEcP65mvY6CClsnC5jRV7cF7YwQCgv
         yDmofY8bjhiaVjKM9Po2y0FnpKGieniZEeU1RbpvhZkATRQ4+WbzpPAcO2OJResOhVed
         Ex2snps8nlIJD4EOV99+muBzJXA64MDEzZTfshy/CO4Qjye/QKB9TAX/OK3SwHaPqqEZ
         VvAeFb8JfQDC2R5EI3rYQrK0SkIBpKw0pIIZK53YSyrRBgwchYWVQpMVyQBaklV7J8eT
         6Z1g==
X-Forwarded-Encrypted: i=1; AJvYcCXLx+bZo6lagv8ImwE3RZKEv7+KAdzm51oGJtUQ3golDzXZbc8HwGlw7DRBzHgvrCfYROXON7niqk83@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+YitoEzGEuhROPbBqK6k2E+3X5M9SgHIdy1JZzHmaolSyhVzM
	GF4URzkWv97cJjzDBCeQ0c9fySIn20O1jyCDTTASTdncr6XfGHdPaXpKiK9BUkmhTdg=
X-Gm-Gg: ASbGnctbWDzT5qHKuQbne4lAkOMzyfV+JcJiRbu8rUqruIKeUAy8Wv58pJ0BzXn3XJr
	hMDOlczQ7lAB+wbL8mC2+AH+YZnuGM1hCieotejHGeC9zAekmyio36FUsPwQQ0WYz/NMZ9sjmMQ
	EnN2M/CRsK/UOUL+uXH/Nn9jvxhL7/B7Erxqv3fnkDO2GfhmEeXqvtYqzpRqsZG0mQTOdFY+2aX
	W7MpheimIUEqnAoqkOMdmq+hDksvCKgYB3/WtwN03QfrnpQJaC9W9V3AZozn8MWWzqFxs3ZcG6f
	mVelLz7lnmqApThDK+5jHvBpZ8vUXtx/9So1JimIDvrLej+5sRgpozWnYlPOe/yaaoJSiq1Ki0y
	ELmRU0ufykGpaPlLhr9vOt35dNTVxtzUOK5PwMzfVr50TuwZyMmB24KPmiXUUqRNf/rS/uy0VZ2
	/erhEJjB3B
X-Google-Smtp-Source: AGHT+IEWdT0uV5uWHBTGFPHzbW80DutwkV0QHsEFy4zvFBG9BlThbgSAanJ2aRukrqMaWzzZN+v30Q==
X-Received: by 2002:a05:600c:350b:b0:46e:5100:326e with SMTP id 5b1f17b1804b1-4777327e71bmr107922525e9.23.1762871950232;
        Tue, 11 Nov 2025 06:39:10 -0800 (PST)
Received: from jiri-mlt ([140.209.217.211])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-477815faadesm21513965e9.0.2025.11.11.06.39.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Nov 2025 06:39:08 -0800 (PST)
Date: Tue, 11 Nov 2025 15:39:03 +0100
From: Jiri Pirko <jiri@resnulli.us>
To: Saeed Mahameed <saeed@kernel.org>
Cc: Jakub Kicinski <kuba@kernel.org>, 
	Daniel Zahka <daniel.zahka@gmail.com>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Srujana Challa <schalla@marvell.com>, 
	Bharat Bhushan <bbhushan2@marvell.com>, Herbert Xu <herbert@gondor.apana.org.au>, 
	Brett Creeley <brett.creeley@amd.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	Michael Chan <michael.chan@broadcom.com>, Pavan Chebbi <pavan.chebbi@broadcom.com>, 
	Tony Nguyen <anthony.l.nguyen@intel.com>, Przemek Kitszel <przemyslaw.kitszel@intel.com>, 
	Sunil Goutham <sgoutham@marvell.com>, Linu Cherian <lcherian@marvell.com>, 
	Geetha sowjanya <gakula@marvell.com>, Jerin Jacob <jerinj@marvell.com>, 
	hariprasad <hkelam@marvell.com>, Subbaraya Sundeep <sbhatta@marvell.com>, 
	Tariq Toukan <tariqt@nvidia.com>, Saeed Mahameed <saeedm@nvidia.com>, 
	Leon Romanovsky <leon@kernel.org>, Mark Bloch <mbloch@nvidia.com>, Ido Schimmel <idosch@nvidia.com>, 
	Petr Machata <petrm@nvidia.com>, Manish Chopra <manishc@marvell.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Siddharth Vadapalli <s-vadapalli@ti.com>, Roger Quadros <rogerq@kernel.org>, 
	Loic Poulain <loic.poulain@oss.qualcomm.com>, Sergey Ryazanov <ryazanov.s.a@gmail.com>, 
	Johannes Berg <johannes@sipsolutions.net>, Vladimir Oltean <olteanv@gmail.com>, 
	Michal Swiatkowski <michal.swiatkowski@linux.intel.com>, Aleksandr Loktionov <aleksandr.loktionov@intel.com>, 
	Dave Ertman <david.m.ertman@intel.com>, Vlad Dumitrescu <vdumitrescu@nvidia.com>, 
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>, Alexander Sverdlin <alexander.sverdlin@gmail.com>, 
	Lorenzo Bianconi <lorenzo@kernel.org>, netdev@vger.kernel.org, linux-doc@vger.kernel.org, 
	intel-wired-lan@lists.osuosl.org, linux-rdma@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org
Subject: Re: [PATCH net-next v3 2/2] net/mlx5: implement swp_l4_csum_mode via
 devlink params
Message-ID: <cgg6fxjjf6zq6yyzx4njhjmetrlhjgor4lzktwe6nls6rgqd6s@c3abd3ehlzvr>
References: <20251107204347.4060542-1-daniel.zahka@gmail.com>
 <20251107204347.4060542-3-daniel.zahka@gmail.com>
 <aQ7f1T1ZFUKRLQRh@x130>
 <jhmdihtp63rblcjiy2pibhnz2sikvbm6bhnkclq3l2ndxgbqbb@e3t23x2x2r46>
 <20251110154643.66d15800@kernel.org>
 <aRKs6jXqSvC3G_R0@x130>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aRKs6jXqSvC3G_R0@x130>

Tue, Nov 11, 2025 at 04:26:34AM +0100, saeed@kernel.org wrote:
>On 10 Nov 15:46, Jakub Kicinski wrote:
>> On Sun, 9 Nov 2025 11:46:37 +0100 Jiri Pirko wrote:
>> > >So, I checked a couple of flows internally, and it seems this allows
>> > >some flexibility in the FW to decide later on which mode to pick,
>> > >based on other parameters, which practically means
>> > >"user has no preference on this param". Driver can only find out
>> > >after boot, when it reads the runtime capabilities, but still
>> > >this is a bug, by the time the driver reads this (in devlink), the
>> > >default value should've already been determined by FW, so FW must
>> > >return the actual runtime value. Which can only be one of the following
>> > 
>> > I don't think it is correct to expose the "default" as a value.
>> > 
>> > On read, user should see the configured value, either "full_csum" or
>> > "l4_only". Reporting "default" to the user does not make any sense.
>> > On write, user should pass either "full_csum" or "l4_only". Why we would
>> > ever want to pass "default"?
>> 
>> FWIW I agree that this feels a bit odd. Should the default be a flag
>> attr? On get flag being present means the value is the FW default (no
>> override present). On set passing the flag means user wants to reset
>> to FW default (remove override)?
>> 
>> > Regardless this patch, since this is param to be reflected on fw reboot
>> > (permanent cmode), I think it would be nice to expose indication if
>> > param value passed to user currently affects the fw, or if it is going
>> > to be applied after fw reboot. Perhaps a simple bool attr would do?
>> 
>> IIUC we're basically talking about user having no information that
>> the update is pending? Could this be done by the core? Core can do
>> a ->get prior to calling ->set and if the ->set succeeds and
>> cmode != runtime record that the update is pending?
>> 
>
>Could work if on GET driver reads 'current' value from FW, then it should
>be simpler if GET != SET then 'pending', one problem though is if SET was
>done by external tool or value wasn't applied after reboot, then we loose
>that information, but do we care? I think we shouldn't.
>
>> That feels very separate from the series tho, there are 3 permanent
>> params in mlx5, already. Is there something that makes this one special?

Agreed. That is why I wrote "regardless this patch". But I think the
pending indication is definitelly nice to have.


>
>In mlx5 they all have the same behavior, devlink sets 'next' value, devlink
>reads 'next' value. The only special thing about the new param
>is that it has a 'device_default' value and when you read that from 'next' it
>will always show 'device_default' as the actual value is only
>known at run time ,e.g. 'next boot'.
>
>I think the only valid solution for permanent and drv_init params is to
>have 'next' and 'current' values reported by driver on read. Or maybe go just
>with  'set' != 'get' then 'pending' as discussed above ?

Hmm, is it possible to rebind the driver without fw going through
next-boot phase? I'm wondering if it wouldn't be safer to have this
pending flag set to be responsibility of the driver...


>


Return-Path: <linux-omap+bounces-2857-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F1E8F9F765E
	for <lists+linux-omap@lfdr.de>; Thu, 19 Dec 2024 08:55:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 45B0616A599
	for <lists+linux-omap@lfdr.de>; Thu, 19 Dec 2024 07:55:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B3D8217F24;
	Thu, 19 Dec 2024 07:53:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="KqciGSJM";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="SF8Q8Vcr";
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="pT46SzxK";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="J13DRa3c"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B698216E2D;
	Thu, 19 Dec 2024 07:53:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734594832; cv=none; b=ZaIUtOj8Jxk70HnOj0ivycPzE/tUH0vZXVcfcBYBst9eraLrIVTobtqIV9VEPwuHNTfk9YHAOBit3Jx6G/Id97OfCLtdpvFo+/dsYZrRapLz7XboSl9JRHshszWvX4NndPxez+CQpdBTAIz/kKVabyD+L3Vuv9aYkY/LXr49Zig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734594832; c=relaxed/simple;
	bh=c5FnF0QAYuAfIcblRDvC0icQEmf0ZtXJkB6mtmXoqqM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=r/w8+my12prGXy/pycG9W9hTb0wWaeAqaZ/UiU8j1YoF44+xGafDRMWmuVJPDhhftKD56i1ars8/htWUDQMBNTkjAazUyJ3/1GJxH842RX6t7OcdaChRUZhLveTpkCpmjoDH4je2oQFVTjZZg0PvT4Ej+tS57NJtAdM8vJ2mEEg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz; spf=pass smtp.mailfrom=suse.cz; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=KqciGSJM; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=SF8Q8Vcr; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=pT46SzxK; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=J13DRa3c; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.cz
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id E8D462115A;
	Thu, 19 Dec 2024 07:53:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1734594828; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=mOH57Lo24ytvyssYkgtONoz/TnP0EselXR6uAYu+hoA=;
	b=KqciGSJMp5o3Psc97/t9hLzsFotQQWdvhfVHKwY37TvnpN1FtH3+tR/av2daJaX0j3UJkN
	SakXBfOrb8OXBEy4xQxfJ/lS1cl4murwt+ANYYoAp3LtnQQClsk0I1YRdUYgXYCECDC+8u
	IQDs1jOrkll9M5N1U0sF6wD6asmcRkE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1734594828;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=mOH57Lo24ytvyssYkgtONoz/TnP0EselXR6uAYu+hoA=;
	b=SF8Q8VcrlszM5gussUWm4a8YfiLmBMlvdV/2LLlwjHYcmdYQzUGPbzT9UOIO4Z9jfeGbKg
	fuUnSd5Aw/InHpCQ==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.cz header.s=susede2_rsa header.b=pT46SzxK;
	dkim=pass header.d=suse.cz header.s=susede2_ed25519 header.b=J13DRa3c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1734594827; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=mOH57Lo24ytvyssYkgtONoz/TnP0EselXR6uAYu+hoA=;
	b=pT46SzxKYpsJ6LxAXvquUhW73xGgRWRGnuOJU42BIBGXNgRrSKj93gMXjgk4S4ZQ0Any95
	gDePZg7wjOy0C/yOx1rotsPJhcLs2B6qEaZiB+MN9MYeZ1iUASo7MN7gwVxy4tm1R335Bb
	V4607DV99NX1rsHRiyFOAyJSqn/+U1Q=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1734594827;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=mOH57Lo24ytvyssYkgtONoz/TnP0EselXR6uAYu+hoA=;
	b=J13DRa3ctQenCe1tvPsrBTaDhk8clSFnf+k/n5VQMdzZr6UYo4EUDhYDw912kwv5aIrX5b
	JHwZHkp0Ig0BwACw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id AFE4113A77;
	Thu, 19 Dec 2024 07:53:47 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id xv3mKQvRY2fDNAAAD6G6ig
	(envelope-from <jslaby@suse.cz>); Thu, 19 Dec 2024 07:53:47 +0000
Message-ID: <dcdc22f2-587e-4879-a987-71c92c0149e9@suse.cz>
Date: Thu, 19 Dec 2024 08:53:47 +0100
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/6] tty: n_gsm: Add support for serdev drivers
To: Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>, Pavel Machek
 <pavel@ucw.cz>, Johan Hovold <johan@kernel.org>
Cc: Tony Lindgren <tony@atomide.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Rob Herring <robh@kernel.org>, Alan Cox <gnomes@lxorguk.ukuu.org.uk>,
 Lee Jones <lee.jones@linaro.org>, Merlijn Wajer <merlijn@wizzup.org>,
 Peter Hurley <peter@hurleysoftware.com>, Sebastian Reichel <sre@kernel.org>,
 linux-serial@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org,
 phone-devel@vger.kernel.org
References: <20200512214713.40501-1-tony@atomide.com>
 <20200512214713.40501-2-tony@atomide.com> <20200528093102.GC10358@localhost>
 <20201129205144.GA15038@duo.ucw.cz>
 <b9220ab2-0992-41d0-abef-f9ec6e306af1@gmail.com>
Content-Language: en-US
From: Jiri Slaby <jslaby@suse.cz>
Autocrypt: addr=jslaby@suse.cz; keydata=
 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
In-Reply-To: <b9220ab2-0992-41d0-abef-f9ec6e306af1@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: E8D462115A
X-Spam-Score: -3.01
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FREEMAIL_TO(0.00)[gmail.com,ucw.cz,kernel.org];
	DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.cz:+];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[];
	ASN(0.00)[asn:25478, ipnet:::/0, country:RU];
	TO_DN_SOME(0.00)[]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO
X-Spam-Level: 

On 19. 12. 24, 8:45, Ivaylo Dimitrov wrote:
> Hi,
> 
> ...
> 
> On 29.11.20 г. 22:51 ч., Pavel Machek wrote:
>>>
>>> It looks like you may also have a problem with tty hangups, which serdev
>>> does not support currently. There are multiple paths in n_gsm which can
>>> trigger a hangup (e.g. based on remote input) and would likely lead to a
>>> crash
>>
>> I don't believe we need to support hangups for the Droid 4, but
>> obviously it would be good not to crash. But I don't know where to
>> start looking, do you have any hints?
>>
> 
> I changed the patch so it calls tty_port_register_device_serdev, ported 
> gnss driver to use serdev_device, got it working:
> 
> root@devuan-droid4:~# cat /dev/gnss0
> $GPGGA,,,,,,0,,,,,,,,*66
> $GNGNS,,,,,,NN,,,,,,*53
> $GNGNS,,,,,,NN,,,,,,*53
> $GNGNS,,,,,,NN,,,,,,*53
> $GPVTG,,T,,M,,N,,K,N*2C
> $GPRMC,,V,,,,,,,,,,N*53
> $GPGSA,A,1,,,,,,,,,,,,,,,*1E
> $GLGSV,1,1,01,255,,,37*52
> $GPGGA,,,,,,0,,,,,,,,*66
> $GNGNS,,,,,,NN,,,,,,*53
> $GNGNS,,,,,,NN,,,,,,*53
> $GNGNS,,,,,,NN,,,,,,*53
> 
> However, I get:
> 
> gsmtty gsmtty4: tty_hangup: tty->count(1) != (#fd's(0) + #kopen's(0))
> 
> when closing /dev/gnss0
> 
> Any hint what shall be implemented in serdev to properly handle hangups? 

Without code, no.

> Or, shall I ignore that warning?

Definitely not.

thanks,
-- 
js
suse labs


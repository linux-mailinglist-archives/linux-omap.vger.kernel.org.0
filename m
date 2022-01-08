Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E5A774883DF
	for <lists+linux-omap@lfdr.de>; Sat,  8 Jan 2022 14:58:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229544AbiAHN6U (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sat, 8 Jan 2022 08:58:20 -0500
Received: from sender11-of-o51.zoho.eu ([31.186.226.237]:21185 "EHLO
        sender11-of-o51.zoho.eu" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229486AbiAHN6U (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Sat, 8 Jan 2022 08:58:20 -0500
ARC-Seal: i=1; a=rsa-sha256; t=1641650273; cv=none; 
        d=zohomail.eu; s=zohoarc; 
        b=d5q6hQaE6CAivfFg4bEbzI/4xoFiPBTuUHB0JpI3ZesXO8dtWH5MsLgTlLt1LAFg0Dmmj8dskJ2dJ/ypnEdvprlj5Zo9z42L0q2Z2UQtS+w2Lw40HMVVodVP12nqnf1rcfzDy96C+KCjhkCfNc1yXhdFyTXoggXOmMkkyFWNNc4=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.eu; s=zohoarc; 
        t=1641650273; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
        bh=db5dCjQMdprZm2Q/1BnWSui0du673YXgro1crJr6KQ8=; 
        b=ARQp6LaC+RyK2nl4fndultqFUsktM7AH3/Y+DjcEmsT4LsvWKutCP+Y3UZ2zn11rxv5ZapiaAd5UHzLt4WfA90orJO7kiX8qAM+LUO1K01kJJGyGYmx9jDuWG8r6kQssAd8p4YZuD2rvlr18p6st5I5Th+KHd0xjP/vDgNWkl+I=
ARC-Authentication-Results: i=1; mx.zohomail.eu;
        spf=pass  smtp.mailfrom=philipp@uvos.xyz;
        dmarc=pass header.from=<philipp@uvos.xyz>
Received: from UVOSLinux (aftr-37-201-192-86.unity-media.net [37.201.192.86]) by mx.zoho.eu
        with SMTPS id 164165027124930.82840161754507; Sat, 8 Jan 2022 14:57:51 +0100 (CET)
Date:   Sat, 8 Jan 2022 14:57:49 +0100
From:   Carl Philipp Klemm <philipp@uvos.xyz>
To:     kuninori.morimoto.gx@gmail.com
Cc:     alsa-devel@alsa-project.org, merlijn@wizzup.org, tony@atomide.com,
        sre@kernel.org, linux-omap@vger.kernel.org,
        kuninori.morimoto.gx@renesas.com
Subject: Re: [RFC PATCH 1/3] ASoC: simple-card-utils: add support for
 componants provideing jack events via set_jack
Message-Id: <20220108145749.f55500222b049f344415a5c3@uvos.xyz>
In-Reply-To: <87r19ld48v.wl-kuninori.morimoto.gx@gmail.com>
References: <20211228190931.df5d518220080a734532ebfd@uvos.xyz>
        <87a6gawxpe.wl-kuninori.morimoto.gx@gmail.com>
        <20220105101028.620b7f2cb7727eedfccd933e@uvos.xyz>
        <87r19ld48v.wl-kuninori.morimoto.gx@gmail.com>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.33; x86_64-unknown-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi,

> (X)	int asoc_simple_init_jack(...)
> 	{
> 		...
> 		if (gpio_is_valid(det)) {
> 			...
> 
> 			snd_soc_card_jack_new(...);
> 			snd_soc_jack_add_gpios(...);
> 			for_each_card_components(card, component)
> (Y)				snd_soc_component_set_jack(component, ...);
> 		}
> 		...
> 	}

So for the case of cpcap codec on motorola mapphones this dosent help,
because we dont have a gpio to sense plug state, thus no gpio in dts
and thus gpio_is_valid will return false, therefore, no jack.

Moving 

sjack->pin.pin		= pin_name;
sjack->pin.mask		= mask;

snd_soc_card_jack_new(card, pin_name, mask,
		      &sjack->jack,
		      &sjack->pin, 1);

and

for_each_card_components(card, component)
			snd_soc_component_set_jack(component, &sjack->jack, NULL);

outside of the if block should make this work, at least cpcap gets the jack then.
-- 
Carl Philipp Klemm <philipp@uvos.xyz> <carl@uvos.xyz>

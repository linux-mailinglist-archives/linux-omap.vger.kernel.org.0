Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 037A0AED87
	for <lists+linux-omap@lfdr.de>; Tue, 10 Sep 2019 16:44:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726132AbfIJOo5 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 10 Sep 2019 10:44:57 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:33679 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387874AbfIJOo4 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 10 Sep 2019 10:44:56 -0400
Received: by mail-wr1-f67.google.com with SMTP id u16so20876245wrr.0;
        Tue, 10 Sep 2019 07:44:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=K5duO6IbkJ8p2e8p4z12GaGcHnnxC09bJLQvbWViWok=;
        b=fu4g8oruUidKGWMGKAQilbHJ3zZ7QI7stPHT9LX/emhpA0g/uhNnCIfSzvekCRxVHx
         Wnrh4cBhFQ05o5vH8hUWdGFnFKzPPI9fi/iv6vHcJlFrQ1nMCaJ5BpIulyKguP3lhglr
         9e74K100oZ8+JWH98eeNglVWTOWnCXBZMme6/Lw6ruC2MmV+R72Ou/j9luMFFmINvC1f
         0GiPVVVtqRaVbXqxLF3HVhEllIaskwiqn2821fB3L4wcOj8TsZS0O0kHENJXS4uCTrJQ
         YxZ3oWIPlmC3d7SH/UJsQs1IRCIUc/CdG9PM4XnY07ShLokUiUoQhY2q4EV9Sjn6/cVT
         TbNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=K5duO6IbkJ8p2e8p4z12GaGcHnnxC09bJLQvbWViWok=;
        b=PISmjsUgPwc5MVWmHYBw9C7tQTavaRAU4dy6mixx8KKOFw50pPrHEumzOvVQtCEJA9
         X3/icrjdE1aUEpPWcEd+VpuZ3BnTD1BRf8HMp2YYWxFMThosNW/zgV8kAC06YuyzI6+p
         O17jqfpRHzkUBJNihHAp6G5cPGOYjuDvGsGCJUGIGeSB23tRCA9AaaEcrw9wRjAdj9kO
         okdvS+vSuJBj2zGUTt+DVoMfgoE8q3WDgDoDl8MMmiVCMhXDvjqbzUyfkNPgIt9CbsvX
         x7iPbvhU6MMEgEEuDPg9BHMMOFA9NqwQngGs8M8puQ33gakMe6+3tgA3K5A1oYGf4eq3
         hjeA==
X-Gm-Message-State: APjAAAUGVGM//3oNS5sG3aD3wK/HwgB80WMjlj96GZRy3OyDxtzK9bDJ
        yCyL4C/FXPnUv8GsIuyHyTo=
X-Google-Smtp-Source: APXvYqy8oCF9jzlFwjhls5MC+bV0p4KcSxaCpKbMvnhXuGJ9mOg6cetjGtTvTEefF3ROADm+FtzlQA==
X-Received: by 2002:a5d:45c3:: with SMTP id b3mr27792792wrs.207.1568126694371;
        Tue, 10 Sep 2019 07:44:54 -0700 (PDT)
Received: from pali ([2a02:2b88:2:1::5cc6:2f])
        by smtp.gmail.com with ESMTPSA id a192sm5705205wma.1.2019.09.10.07.44.52
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 10 Sep 2019 07:44:53 -0700 (PDT)
Date:   Tue, 10 Sep 2019 16:44:52 +0200
From:   Pali =?utf-8?B?Um9ow6Fy?= <pali.rohar@gmail.com>
To:     Sebastian Reichel <sre@kernel.org>
Cc:     Adam Ford <aford173@gmail.com>, Tony Lindgren <tony@atomide.com>,
        Mark Rutland <mark.rutland@arm.com>,
        devicetree <devicetree@vger.kernel.org>,
        Paul Walmsley <paul@pwsan.com>,
        Aaro Koskinen <aaro.koskinen@iki.fi>,
        Russell King <linux@armlinux.org.uk>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Tero Kristo <t-kristo@ti.com>,
        Rob Herring <robh+dt@kernel.org>,
        =?utf-8?Q?Beno=C3=AEt?= Cousson <bcousson@baylibre.com>,
        Linux-OMAP <linux-omap@vger.kernel.org>,
        Adam Ford <adam.ford@logicpd.com>,
        arm-soc <linux-arm-kernel@lists.infradead.org>
Subject: Re: [RFC] ARM: omap3: Enable HWMODS for HW Random Number Generator
Message-ID: <20190910144452.vmhmls3xhh6hd5xw@pali>
References: <20190828150037.2640-1-aford173@gmail.com>
 <20190905230443.GA52127@atomide.com>
 <CAHCN7xKxffJUV2V2CCuw0iPqUm4LJT28GMrcF2=8rDJQM2dOOw@mail.gmail.com>
 <20190910143732.3g3q4acvnx2pqvjx@earth.universe>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190910143732.3g3q4acvnx2pqvjx@earth.universe>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Tuesday 10 September 2019 15:37:32 Sebastian Reichel wrote:
> Hi,
> 
> On Tue, Sep 10, 2019 at 08:56:49AM -0500, Adam Ford wrote:
> > On Thu, Sep 5, 2019 at 6:04 PM Tony Lindgren <tony@atomide.com> wrote:
> > > Oh and this needs to default to status = "disabled" for
> > > HS devices like n900 as it needs to use the omap3-rom-rng.
> > 
> > I don't know enough about the HS version of the OMAP3, but what's the
> > main difference between omap3-rom-rng and this one?
> 
> The OMAP HS chips have the bus firewall configured to block direct
> access to some cryptography related devices. The kernel will crash
> with a bus error, if you try to read/write the registers for
> protected devices.

And if you try to read it more times, SOC would be rebooted for security
reasons.

> The omap3-rom-rng avoids this by communicating
> with the security middleware component instead of directly accessing
> the RNG hardware.

And that component is loaded by signed bootloader into "secure" area not
accessible by "non-secure" work (like kernel) and communication is done
via arm smc instruction.

-- 
Pali Rohár
pali.rohar@gmail.com

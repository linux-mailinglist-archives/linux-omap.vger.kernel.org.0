Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5B9AD1B5AAC
	for <lists+linux-omap@lfdr.de>; Thu, 23 Apr 2020 13:43:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727084AbgDWLnX (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 23 Apr 2020 07:43:23 -0400
Received: from mail-lj1-f193.google.com ([209.85.208.193]:43943 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727041AbgDWLnV (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 23 Apr 2020 07:43:21 -0400
Received: by mail-lj1-f193.google.com with SMTP id l19so5836902lje.10;
        Thu, 23 Apr 2020 04:43:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=C7lj58MFnLePtA19l1qlYr6e++DcjSNazO2l/JEQ44w=;
        b=GQxJrhN1HJmf0PEh02R4CQlQq/Jc/cfcCcgfhomOtMAfSkyCGFjh8dNxzxgVHxyrAN
         w6rLCT94FH1CHiGvdKT06vXfGS0xd6QI7x2xB7vtNejCN2QQmAFSBQjTklLXQxNQ2vEp
         ZD4++79mLRT62BX14IeinIId6seG4fdTBDGk+ehNA1N3ksY+0nOmwzZGlNPNjG/1eT45
         ValhXzSPe6nEa+MfzpGq/uzgXl8tcwv8EkKCHAs+mGWku8/ZdVoyDbWDPdhlH7UycANi
         NdNjdVU4NX1PEFPkXk/84ezBD6QNmBVdYzk4UA2QJvNFAmN2n0lW9k65df7ssH3VDN3o
         YKNQ==
X-Gm-Message-State: AGi0PuZRmhod6jK/rFustsW0ObfCw1IoPo/kThtCz0gAvQ35wmYufGPq
        3JQpOu012nIROKnNThMbR7g=
X-Google-Smtp-Source: APiQypLpXxwpZWbjR9D3X5tsAZC+au1GagS5X6SZYtkKVLlZ7Vj6uBrtzkk360XXCFwFPPxnLcWh7g==
X-Received: by 2002:a2e:a169:: with SMTP id u9mr2231221ljl.144.1587642197450;
        Thu, 23 Apr 2020 04:43:17 -0700 (PDT)
Received: from xi.terra (c-beaee455.07-184-6d6c6d4.bbcust.telenor.se. [85.228.174.190])
        by smtp.gmail.com with ESMTPSA id 16sm1613269ljr.55.2020.04.23.04.43.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Apr 2020 04:43:16 -0700 (PDT)
Received: from johan by xi.terra with local (Exim 4.92.3)
        (envelope-from <johan@kernel.org>)
        id 1jRaGM-0004uT-CR; Thu, 23 Apr 2020 13:43:26 +0200
Date:   Thu, 23 Apr 2020 13:43:26 +0200
From:   Johan Hovold <johan@kernel.org>
To:     Tony Lindgren <tony@atomide.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Alan Cox <gnomes@lxorguk.ukuu.org.uk>,
        Lee Jones <lee.jones@linaro.org>, Jiri Slaby <jslaby@suse.cz>,
        Johan Hovold <johan@kernel.org>,
        Merlijn Wajer <merlijn@wizzup.org>,
        Pavel Machek <pavel@ucw.cz>,
        Peter Hurley <peter@hurleysoftware.com>,
        Sebastian Reichel <sre@kernel.org>,
        linux-serial@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org
Subject: Re: [PATCHv6 0/4] n_gsm serdev support and protocol driver for
 droid4 modem
Message-ID: <20200423114326.GQ18608@localhost>
References: <20200421232752.3070-1-tony@atomide.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200421232752.3070-1-tony@atomide.com>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi Tony,

On Tue, Apr 21, 2020 at 04:27:48PM -0700, Tony Lindgren wrote:
> Hi all,
> 
> Here's v4 set of n_gsm serdev support patches, and the related protocol
> driver for the modem found on Motorola Mapphone phones and tablets
> like droid4.
> 
> This series only adds basic character device support for the serdev
> driver. Other serdev consumer drivers for specific devices will be
> posted separately.

I'm still missing an architectural (design) overview here -- reviewer
time is a scarce resource.

I also suggested earlier that you include, at least as an RFC, one or
more of your child-device drivers so that we can see how this ends up
being used in the end (including an example devicetree).

Some high-level comments until then:

I'm not sure that a plain chardev interface for the mux channels is the
right interface. The n_gsm ldisc exposes tty devices and I think your
serdev adaptation should continue to do that.

On that note; you're not actually adding general TS 27.010 serdev
support, but rather some hooks and a custom driver and interface (mfd +
/dev/motmdmN) for one particular modem.

I'd rather see a generic implementation which can be used with other
modems and that continues to expose a /dev/gsmttyN interface to which we
could attach serdev clients instead (and not create a motmdm serdev
replica of sorts).

I know the location of this driver has been up for discussion already,
but drivers/tty/serdev/protocol still isn't right (e.g. we don't have an
drivers/i2c/protocol directory where we stuff random i2c client
drivers).

It's an mfd + custom chardev driver for a modem and related to n_gsm
(even more if you add generic serdev support). Currently, drivers/mfd or
drivers/misc appear to be better choices. Otherwise, n_gsm lives in
drivers/tty since it's a line discipline, but it could be moved to a new
drivers/modem if needed (cf. the bluetooth hci ldisc).

Last, it seems you've based the serdev-ngsm-motmdm.c chardev
implementation on a more or less verbatim copy of drivers/gnss/core.c.
I'd appreciate if you could mention that in the file header and
reproduce the copyright notice if you end up keeping that interface.

> Tony Lindgren (4):
>   tty: n_gsm: Add support for serdev drivers
>   serdev: ngsm-motmdm: Add Motorola TS 27.010 serdev modem driver for
>     droid4
>   dt-bindings: serdev: motmdm: Add binding for motorola-mdm
>   ARM: dts: omap4-droid4: Enable basic modem support
> 
>  .../serdev/motorola,mapphone-mdm6600.yaml     |   34 +
>  .../boot/dts/motorola-mapphone-common.dtsi    |    6 +
>  drivers/tty/n_gsm.c                           |  372 +++++
>  drivers/tty/serdev/Kconfig                    |    2 +
>  drivers/tty/serdev/Makefile                   |    2 +
>  drivers/tty/serdev/protocol/Kconfig           |   14 +
>  drivers/tty/serdev/protocol/Makefile          |    3 +
>  .../tty/serdev/protocol/serdev-ngsm-motmdm.c  | 1191 +++++++++++++++++
>  include/linux/serdev-gsm.h                    |  168 +++
>  9 files changed, 1792 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/serdev/motorola,mapphone-mdm6600.yaml
>  create mode 100644 drivers/tty/serdev/protocol/Kconfig
>  create mode 100644 drivers/tty/serdev/protocol/Makefile
>  create mode 100644 drivers/tty/serdev/protocol/serdev-ngsm-motmdm.c
>  create mode 100644 include/linux/serdev-gsm.h

Johan

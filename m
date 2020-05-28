Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3FED51E5B05
	for <lists+linux-omap@lfdr.de>; Thu, 28 May 2020 10:39:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727882AbgE1Ijc (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 28 May 2020 04:39:32 -0400
Received: from mail-lf1-f65.google.com ([209.85.167.65]:38919 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727855AbgE1Ij3 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 28 May 2020 04:39:29 -0400
Received: by mail-lf1-f65.google.com with SMTP id z206so12455390lfc.6;
        Thu, 28 May 2020 01:39:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=E7GhMIypOFt2CbhLCZT1C6Uvs9N17uL6PbNxv1EBNg4=;
        b=cx2l6J6RnKRqu+T5lSaLeBaInU+bbEPTSg1koDT6TNbIm6YT1ZnXZqWR4gsb53pCX2
         Utk8XAVWG1dG7QNlGzUyXCeRd9Etn2t1AKuQT4iNB9S1Z+3d4PAo9bLhqIzB6Jsr6r+V
         pP2ChDRvZxBl5utLAAx5OOJq+fI/nluut23j4CPHkpVXLqLp6NVlZ4RwyiyCN7H4izrT
         f2ohmc1cseOWG6kzVz3MqQqB9GDtP8IPfLe/Mn4llItnrSJNYu/cQ6q4UsJ7DkH71y+m
         WzqtQMOI0il1tqzQX8/g9re19XHN1KT9w9ymZE+JvCu83MvIif4pD0EIomVNovYHjLZ+
         cmuA==
X-Gm-Message-State: AOAM533WsNBEIS5E9ijPTVys0kyyCHNVxD4dohJvWFoWZFWS6lTTI+0j
        8yeOExxuyMxygqRBMP5XBPMHg4Pe
X-Google-Smtp-Source: ABdhPJyiRSrWuGDgDCFtRdhsn8NanQj8YASn1UumVYA0gWYwHjM8SjpdQX0SmD4NTAEvvKAj22xkFA==
X-Received: by 2002:a05:6512:682:: with SMTP id t2mr1120938lfe.101.1590655166384;
        Thu, 28 May 2020 01:39:26 -0700 (PDT)
Received: from xi.terra (c-beaee455.07-184-6d6c6d4.bbcust.telenor.se. [85.228.174.190])
        by smtp.gmail.com with ESMTPSA id a8sm1299087ljp.102.2020.05.28.01.39.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2020 01:39:25 -0700 (PDT)
Received: from johan by xi.terra with local (Exim 4.93.0.4)
        (envelope-from <johan@kernel.org>)
        id 1jeE4M-00038Z-Fu; Thu, 28 May 2020 10:39:18 +0200
Date:   Thu, 28 May 2020 10:39:18 +0200
From:   Johan Hovold <johan@kernel.org>
To:     Tony Lindgren <tony@atomide.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Johan Hovold <johan@kernel.org>, Rob Herring <robh@kernel.org>,
        Alan Cox <gnomes@lxorguk.ukuu.org.uk>,
        Lee Jones <lee.jones@linaro.org>, Jiri Slaby <jslaby@suse.cz>,
        Merlijn Wajer <merlijn@wizzup.org>,
        Pavel Machek <pavel@ucw.cz>,
        Peter Hurley <peter@hurleysoftware.com>,
        Sebastian Reichel <sre@kernel.org>,
        linux-serial@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org
Subject: Re: [PATCHv8 0/6] n_gsm serdev support and GNSS driver for droid4
Message-ID: <20200528083918.GB10358@localhost>
References: <20200512214713.40501-1-tony@atomide.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200512214713.40501-1-tony@atomide.com>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Tue, May 12, 2020 at 02:47:07PM -0700, Tony Lindgren wrote:
> Hi all,
> 
> Here's the updated set of these patches fixed up for Johan's and
> Pavel's earlier comments.
> 
> This series does the following:
> 
> 1. Adds functions to n_gsm.c for serdev-ngsm.c driver to use
> 
> 2. Adds a generic serdev-ngsm.c driver that brings up the TS 27.010
>    TTY ports configured in devicetree with help of n_gsm.c
> 
> 3. Allows the use of standard Linux device drivers for dedicated
>    TS 27.010 channels for devices like GNSS and ALSA found on some
>    modems for example

Unfortunately that does not seem to be the case just yet. Your gnss
driver is still aware that it's using n_gsm for the transport and calls
into the "parent" serdev-ngsm driver instead of using the serdev
interface (e.g. as if this was still and MFD driver).

If you model this right, the GNSS driver should work equally well
regardless of whether you use the serial interface (with n_gsm) or USB
(e.g. cdc-acm or usb-serial).

> 4. Adds a gnss-motmdm consumer driver for the GNSS device found on
>    the Motorola Mapphone MDM6600 modem on devices like droid4
> 
> I've placed the serdev-ngsm.c under drivers/tty/serdev as it still
> seems to make most sense with no better places available. It's no
> longer an MFD driver as it really does not need to care what channel
> specific consumer drivers might be configured for the generic driver.
> Now serdev-ngsm just uses of_platform_populate() to probe whatever
> child nodes it might find.
>
> I'm not attached having the driver in drivers/tty/serdev. I just
> don't have any better locations in mind. So using Johan's earlier
> i2c example, the drivers/tty/serdev/serdev-ngsm.c driver is now a
> generic protocol and bus driver, so it's getting closer to the
> the drivers/i2c/busses analogy maybe :) Please do suggest better
> locations other than MFD and misc if you have better ideas.

Please move it up one level to drivers/tty where the n_gsm line
discipline lives. This is (supposed to be) a tty driver exposing tty
devices.

> Now without the chardev support, the /dev/gsmtty* using apps need
> to use "U1234AT+CFUN?" format for the packets. The advantage is
> less kernel code, and we keep the existing /dev/gsmtty* interface.

Would it not be possible to deal with this in a plugin sort of way,
again, similar to how the hci ldisc work with an additional "protocol"
ioctl?

Johan

Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 71E4B1BDCC5
	for <lists+linux-omap@lfdr.de>; Wed, 29 Apr 2020 14:57:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726915AbgD2M44 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 29 Apr 2020 08:56:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46718 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726822AbgD2M4z (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 29 Apr 2020 08:56:55 -0400
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D4672C03C1AE
        for <linux-omap@vger.kernel.org>; Wed, 29 Apr 2020 05:56:53 -0700 (PDT)
Received: by mail-wr1-x444.google.com with SMTP id i10so2378069wrv.10
        for <linux-omap@vger.kernel.org>; Wed, 29 Apr 2020 05:56:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=beagleboard-org.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=XYk/cAtFVHXNtNHbOE2qkoNRhInGbwIFRUiqQNZ88tg=;
        b=a8f8v67xBBbbpVhP2ojbET/hNZ3Ft77EH/K9RBJwH5wAvLfAJLqRVT2ulzFZaaZIXy
         onGt6EFhq3iuy6nIXexzHVJYzYcfkkAzA+6SpfXAI9RskOGq/pXoz/AD1jwiEyky4/79
         cxN3FZXm6gJdqOutPm09CdS5OKpF0APItnoMKKPFV8iMzX8znQ7mOuLK7eN32qZaIq1m
         I/t/KNO7kcR6EGvWH/GWCPerfPLZ/n8tiwz8b+DGInDvsumojtLJWfmr5OknjMByR14R
         QEPY87GcCzIsXU+Jyq5pHfSEPN6fmtm9kCGBigAdgAJRd7EN5XMvzhSIaRUL89Xgmmo6
         /1nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=XYk/cAtFVHXNtNHbOE2qkoNRhInGbwIFRUiqQNZ88tg=;
        b=VFoRUlg4KTPlgsLKdIUUuKSzyQC4YgnYhqTDsdM78OD8NIYW9YbXMQwGt40I03gLaq
         MEcn0RWTW/9M1a3eBFEt8+XFItrSvJEKvPFAGd9KD0Ulxp+59b38OngQzITbxWD2ds76
         2w6goMX0L0lAZqkMAa31vUnUrSQOyhbAe6FtxLWLm/qR/M9foaFnTGithnueJNCOcBCJ
         43DBu4XQMCf1s/+cZcxbc/wPcuHx+9ZmYrjn3eNg/690961Sj5eefqT5/7ktjls6mu4J
         DxOjWKAvSZGD+joXVzAgTeEcjgqhn+UpXdABeW/DF/FiKhbwZZ6dlO6f2VgsxCGXiZ8g
         U6uA==
X-Gm-Message-State: AGi0PuaEmNSgNOCjHcJy2lNgnkwZFD8NjwazOPucU0HfVCsyIfpe4oPb
        oMuB8N5rvqZ67Dt56xR1mzczWQ==
X-Google-Smtp-Source: APiQypJwsQvNohta1HoBo/PvRb08fLLD2gpABkAb6Dkt6t7shvmXZLPP92iCaOUixL+dKtyh4Me/Cg==
X-Received: by 2002:adf:a309:: with SMTP id c9mr36694231wrb.97.1588165012332;
        Wed, 29 Apr 2020 05:56:52 -0700 (PDT)
Received: from x1 (i59F66838.versanet.de. [89.246.104.56])
        by smtp.gmail.com with ESMTPSA id h13sm28683465wrs.22.2020.04.29.05.56.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2020 05:56:51 -0700 (PDT)
Date:   Wed, 29 Apr 2020 14:57:36 +0200
From:   Drew Fustini <drew@beagleboard.org>
To:     Grygorii Strashko <grygorii.strashko@ti.com>
Cc:     =?iso-8859-1?Q?Beno=EEt?= Cousson <bcousson@baylibre.com>,
        Tony Lindgren <tony@atomide.com>,
        Rob Herring <robh+dt@kernel.org>, linux-omap@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jason Kridner <jkridner@beagleboard.org>,
        Robert Nelson <robertcnelson@beagleboard.org>
Subject: Re: [PATCH] arm: dts: am33xx-l4: add gpio-line-names to gpio
 controllers
Message-ID: <20200429125736.GA31476@x1>
References: <20200427233116.GA18917@x1>
 <b15f2577-8a7d-4c18-1633-d47133247f49@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b15f2577-8a7d-4c18-1633-d47133247f49@ti.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Tue, Apr 28, 2020 at 10:37:43AM +0300, Grygorii Strashko wrote:
> 
> 
> On 28/04/2020 02:31, Drew Fustini wrote:
> > Add gpio-line-names properties to the gpio controller nodes.  The names
> > correspond to the AM335x pin names which are also the muxmode 0 signal
> > names.  Refer to "Table 4-2. Pin Attributes" in the TI AM335x Sitara
> > Processors datasheet:
> This misuse GPIO DT bindings:
> "
> Optionally, a GPIO controller may have a "gpio-line-names" property. This is
> an array of strings defining the names of the GPIO lines going out of the
> GPIO controller. This name should be the most meaningful producer name
> for the system, such as a rail name indicating the usage. Package names
> such as pin name are discouraged: such lines have opaque names (since they
> are by definition generic purpose) and such names are usually not very
> helpful. For example "MMC-CD", "Red LED Vdd" and "ethernet reset" are
> reasonable line names as they describe what the line is used for. "GPIO0"
> is not a good name to give to a GPIO line. Placeholders are discouraged:
> rather use the "" (blank string) if the use of the GPIO line is undefined
> in your design. The names are assigned starting from line offset 0 from
> left to right from the passed array. An incomplete array (where the number
> of passed named are less than ngpios) will still be used up until the last
> provided valid line index.
> "

Thank you for pointing out that "Package names such as pin name are
discouraged".  That is what I was doing in that patch which I now
realize is incorrect.

The goal to adding the gpio-line-names was to have gpioinfo provide
helpful information to a user on the BeagleBone.  Currently this is all
that appears when booting 5.7-rc2 on a BegaleBone:

debian@beaglebone:~$ gpioinfo
gpiochip0 - 32 lines:
	line   0:      unnamed       unused   input  active-high
	line   1:      unnamed       unused   input  active-high
	line   2:      unnamed       unused   input  active-high
	line   3:      unnamed       unused   input  active-high
	line   4:      unnamed       unused   input  active-high
	line   5:      unnamed       unused   input  active-high
	line   6:      unnamed         "cd"   input   active-low [used]
	line   7:      unnamed       unused   input  active-high
	line   8:      unnamed       unused   input  active-high
	line   9:      unnamed       unused   input  active-high
	line  10:      unnamed       unused   input  active-high
	line  11:      unnamed       unused   input  active-high
	line  12:      unnamed       unused   input  active-high
	line  13:      unnamed       unused   input  active-high
	line  14:      unnamed       unused   input  active-high
	line  15:      unnamed       unused   input  active-high
	line  16:      unnamed       unused   input  active-high
	line  17:      unnamed       unused   input  active-high
	line  18:      unnamed       unused   input  active-high
	line  19:      unnamed       unused   input  active-high
	line  20:      unnamed       unused   input  active-high
	line  21:      unnamed       unused   input  active-high
	line  22:      unnamed       unused   input  active-high
	line  23:      unnamed       unused   input  active-high
	line  24:      unnamed       unused   input  active-high
	line  25:      unnamed       unused   input  active-high
	line  26:      unnamed       unused   input  active-high
	line  27:      unnamed       unused   input  active-high
	line  28:      unnamed       unused   input  active-high
	line  29:      unnamed       unused   input  active-high
	line  30:      unnamed       unused   input  active-high
	line  31:      unnamed       unused   input  active-high
gpiochip1 - 32 lines:
	line   0:      unnamed       unused   input  active-high
	line   1:      unnamed       unused   input  active-high
	line   2:      unnamed       unused   input  active-high
	line   3:      unnamed       unused   input  active-high
	line   4:      unnamed       unused   input  active-high
	line   5:      unnamed       unused   input  active-high
	line   6:      unnamed       unused   input  active-high
	line   7:      unnamed       unused   input  active-high
	line   8:      unnamed       unused   input  active-high
	line   9:      unnamed       unused   input  active-high
	line  10:      unnamed       unused   input  active-high
	line  11:      unnamed       unused   input  active-high
	line  12:      unnamed       unused   input  active-high
	line  13:      unnamed       unused   input  active-high
	line  14:      unnamed       unused   input  active-high
	line  15:      unnamed       unused   input  active-high
	line  16:      unnamed       unused   input  active-high
	line  17:      unnamed       unused   input  active-high
	line  18:      unnamed       unused   input  active-high
	line  19:      unnamed       unused   input  active-high
	line  20:      unnamed       unused   input  active-high
	line  21:      unnamed "beaglebone:green:usr0" output active-high [used]
	line  22:      unnamed "beaglebone:green:usr1" output active-high [used]
	line  23:      unnamed "beaglebone:green:usr2" output active-high [used]
	line  24:      unnamed "beaglebone:green:usr3" output active-high [used]
	line  25:      unnamed       unused   input  active-high
	line  26:      unnamed       unused   input  active-high
	line  27:      unnamed       unused   input  active-high
	line  28:      unnamed       unused   input  active-high
	line  29:      unnamed       unused   input  active-high
	line  30:      unnamed       unused   input  active-high
	line  31:      unnamed       unused   input  active-high
gpiochip2 - 32 lines:
	line   0:      unnamed       unused   input  active-high
	line   1:      unnamed       unused   input  active-high
	line   2:      unnamed       unused   input  active-high
	line   3:      unnamed       unused   input  active-high
	line   4:      unnamed       unused   input  active-high
	line   5:      unnamed       unused   input  active-high
	line   6:      unnamed       unused   input  active-high
	line   7:      unnamed       unused   input  active-high
	line   8:      unnamed       unused   input  active-high
	line   9:      unnamed       unused   input  active-high
	line  10:      unnamed       unused   input  active-high
	line  11:      unnamed       unused   input  active-high
	line  12:      unnamed       unused   input  active-high
	line  13:      unnamed       unused   input  active-high
	line  14:      unnamed       unused   input  active-high
	line  15:      unnamed       unused   input  active-high
	line  16:      unnamed       unused   input  active-high
	line  17:      unnamed       unused   input  active-high
	line  18:      unnamed       unused   input  active-high
	line  19:      unnamed       unused   input  active-high
	line  20:      unnamed       unused   input  active-high
	line  21:      unnamed       unused   input  active-high
	line  22:      unnamed       unused   input  active-high
	line  23:      unnamed       unused   input  active-high
	line  24:      unnamed       unused   input  active-high
	line  25:      unnamed       unused   input  active-high
	line  26:      unnamed       unused   input  active-high
	line  27:      unnamed       unused   input  active-high
	line  28:      unnamed       unused   input  active-high
	line  29:      unnamed       unused   input  active-high
	line  30:      unnamed       unused   input  active-high
	line  31:      unnamed       unused   input  active-high
gpiochip3 - 32 lines:
	line   0:      unnamed       unused   input  active-high
	line   1:      unnamed       unused   input  active-high
	line   2:      unnamed       unused   input  active-high
	line   3:      unnamed       unused   input  active-high
	line   4:      unnamed       unused   input  active-high
	line   5:      unnamed       unused   input  active-high
	line   6:      unnamed       unused   input  active-high
	line   7:      unnamed       unused   input  active-high
	line   8:      unnamed       unused   input  active-high
	line   9:      unnamed       unused   input  active-high
	line  10:      unnamed       unused   input  active-high
	line  11:      unnamed       unused   input  active-high
	line  12:      unnamed       unused   input  active-high
	line  13:      unnamed       unused   input  active-high
	line  14:      unnamed       unused   input  active-high
	line  15:      unnamed       unused   input  active-high
	line  16:      unnamed       unused   input  active-high
	line  17:      unnamed       unused   input  active-high
	line  18:      unnamed       unused   input  active-high
	line  19:      unnamed       unused   input  active-high
	line  20:      unnamed       unused   input  active-high
	line  21:      unnamed       unused   input  active-high
	line  22:      unnamed       unused   input  active-high
	line  23:      unnamed       unused   input  active-high
	line  24:      unnamed       unused   input  active-high
	line  25:      unnamed       unused   input  active-high
	line  26:      unnamed       unused   input  active-high
	line  27:      unnamed       unused   input  active-high
	line  28:      unnamed       unused   input  active-high
	line  29:      unnamed       unused   input  active-high
	line  30:      unnamed       unused   input  active-high
	line  31:      unnamed       unused   input  active-high

I discussed it with Robert Nelson and Jason Kridner and the idea came up
that using the beagle pin header labels would be more useful than the
AM3358 pin names.

> Additional note. On other TI SoCs like am437x the same gpio line can be routed to more
> than one pin (but only one pin can be used).
> gpio0_0 GPIO IO -> A17, D16

Thank you for that insights.

Instead of am33xx-l4.dtsi, I am thinking of adding a gpio-line-names
property in: source/arch/arm/boot/dts/am335x-bone-common.dtsi

For gpiochip0, line 0 and line 1 would be "" as they are not connected
to P8/P9 header.  line 2 would be labeled "P9_22", line 3 would be
"P9_21", etc.  I'll post a complete patch for am335x-bone-common.dtsi
and the gpioinfo output to demonstrate the usefulness.


thanks,
drew


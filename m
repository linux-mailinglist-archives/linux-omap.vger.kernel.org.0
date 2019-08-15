Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6C6B68EA2F
	for <lists+linux-omap@lfdr.de>; Thu, 15 Aug 2019 13:27:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730609AbfHOL1j (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 15 Aug 2019 07:27:39 -0400
Received: from mail-lf1-f50.google.com ([209.85.167.50]:41800 "EHLO
        mail-lf1-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729909AbfHOL1j (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 15 Aug 2019 07:27:39 -0400
Received: by mail-lf1-f50.google.com with SMTP id 62so1410289lfa.8;
        Thu, 15 Aug 2019 04:27:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=xUxmXNBF0cpbiVK6x0jPufNmerVF62JVW8riEyG2SSg=;
        b=i/B4LZkyTHGRnn3GlG2EeIeggZoupuOFCJDYO6AUgaTqob4f7jtknE1vFXgJtHnnez
         LuTePhPxYpgN12uii5oFJiwsXuYCCrzalUiUNXe1lp7IYwQpxqUd66jfC2jKqW4kAsuh
         f8iRCoYo/JAMOU0J7R2PN0UUkrlXoyZ+Bl/SV+PhbKIbbJuZdCltGhNE+J9A4s5yCRmJ
         B7sMHO0ZpuxCUAGuTDn6QNSVxQ6s/CmzUTL4g1UaR2/SIPpmntAbJgQvROZiOmosUAHg
         j/Ijpt8H4jGJdUVzo+DEeQhIg2xK9ICTvebJwBTXyzUfpb/BWIU7XP93ILWN8VpWzOvg
         ShOA==
X-Gm-Message-State: APjAAAUBUg02r/aQ1tJ1HXC9Uj27Abir3Syo2UGaSZLFMs8mPlsbw1R1
        9iHWGmevmJJIN7SwN5zOXEA=
X-Google-Smtp-Source: APXvYqyR2tocJ5yjqNECkZryDtNzNxZMWT3PiZpHYCtkdJLEPnxCc3kjEFYscHpgkmsc+8XHcTSOlA==
X-Received: by 2002:ac2:5ec3:: with SMTP id d3mr2101249lfq.44.1565868456756;
        Thu, 15 Aug 2019 04:27:36 -0700 (PDT)
Received: from xi.terra (c-51f1e055.07-184-6d6c6d4.bbcust.telenor.se. [85.224.241.81])
        by smtp.gmail.com with ESMTPSA id j30sm400135lfk.48.2019.08.15.04.27.35
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 15 Aug 2019 04:27:36 -0700 (PDT)
Received: from johan by xi.terra with local (Exim 4.92)
        (envelope-from <johan@kernel.org>)
        id 1hyDur-00087s-OG; Thu, 15 Aug 2019 13:27:38 +0200
Date:   Thu, 15 Aug 2019 13:27:37 +0200
From:   Johan Hovold <johan@kernel.org>
To:     Tony Lindgren <tony@atomide.com>
Cc:     Johan Hovold <johan@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, linux-omap@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        =?iso-8859-1?Q?Bj=F8rn?= Mork <bjorn@mork.no>,
        Dan Williams <dan.j.williams@intel.com>,
        Lars Melin <larsm17@gmail.com>,
        Marcel Partap <mpartap@gmx.net>,
        Merlijn Wajer <merlijn@wizzup.org>,
        Michael Scott <hashcode0f@gmail.com>,
        NeKit <nekit1000@gmail.com>, Pavel Machek <pavel@ucw.cz>,
        Sebastian Reichel <sre@kernel.org>
Subject: Re: [PATCHv2] USB: serial: option: Add Motorola modem UARTs
Message-ID: <20190815112737.GD32300@localhost>
References: <20190815082602.51765-1-tony@atomide.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190815082602.51765-1-tony@atomide.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Thu, Aug 15, 2019 at 01:26:02AM -0700, Tony Lindgren wrote:
> On Motorola Mapphone devices such as Droid 4 there are five USB ports
> that do not use the same layout as Gobi 1K/2K/etc devices listed in
> qcserial.c. So we should use qcaux.c or option.c as noted by
> Dan Williams <dan.j.williams@intel.com>.
> 
> As the Motorola USB serial ports have an interrupt endpoint as shown
> with lsusb -v, we should use option.c instead of qcaux.c as pointed out
> by Johan Hovold <johan@kernel.org>.
> 
> The ff/ff/ff interfaces seem to always be UARTs on Motorola devices.
> For the other interfaces, class 0x0a (CDC Data) should not in general
> be added as they are typically part of a multi-interface function as
> noted earlier by Bjørn Mork <bjorn@mork.no>.
> 
> However, looking at the Motorola mapphone kernel code, the mdm6600 0x0a
> class is only used for flashing the modem firmware, and there are no
> other interfaces. So I've added that too with more details below as it
> works just fine.
> 
> The ttyUSB ports on Droid 4 are:
> 
> ttyUSB0 DIAG, CQDM-capable
> ttyUSB1 MUX or NMEA, no response
> ttyUSB2 MUX or NMEA, no response
> ttyUSB3 TCMD
> ttyUSB4 AT-capable

> Tested-by: Pavel Machek <pavel@ucw.cz>
> Signed-off-by: Tony Lingren <tony@atomide.com>

I fixed up the typo in your name here, which checkpatch caught.

> ---
> 
> Changes since v1:
> - Leave out defines as suggested by Lars

Thanks, Tony. Now applied.

Johan

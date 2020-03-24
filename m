Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D046A191681
	for <lists+linux-omap@lfdr.de>; Tue, 24 Mar 2020 17:35:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725767AbgCXQeR convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-omap@lfdr.de>); Tue, 24 Mar 2020 12:34:17 -0400
Received: from muru.com ([72.249.23.125]:33060 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727257AbgCXQeR (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 24 Mar 2020 12:34:17 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 1C43480E1;
        Tue, 24 Mar 2020 16:35:02 +0000 (UTC)
Date:   Tue, 24 Mar 2020 09:34:12 -0700
From:   Tony Lindgren <tony@atomide.com>
To:     Pavel Machek <pavel@denx.de>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Alan Cox <gnomes@lxorguk.ukuu.org.uk>,
        Lee Jones <lee.jones@linaro.org>, Jiri Slaby <jslaby@suse.cz>,
        Johan Hovold <johan@kernel.org>,
        Merlijn Wajer <merlijn@wizzup.org>,
        Peter Hurley <peter@hurleysoftware.com>,
        Sebastian Reichel <sre@kernel.org>,
        linux-serial@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org
Subject: Re: [PATCH 2/4] serdev: ngsm-motmdm: Add Motorola TS 27.010 serdev
 modem driver for droid4
Message-ID: <20200324163412.GZ37466@atomide.com>
References: <20200319173755.65082-1-tony@atomide.com>
 <20200319173755.65082-3-tony@atomide.com>
 <20200322220903.GA28082@amd>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: 8BIT
In-Reply-To: <20200322220903.GA28082@amd>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Pavel Machek <pavel@denx.de> [200322 22:09]:
> Hi!
> 
> > Many Motorola phones are controlling the modem using a custom variant
> > of TS 27.010 serial line discipline. Devices on these modems have a
> > dedicated TS 27.010 channel for features like audio mixer, GNSS, voice
> > modem, SIM card reader and so on.
> 
> I get warning here while applying:
> 
> Applying: serdev: ngsm-motmdm: Add Motorola TS 27.010 serdev modem
> driver for droid4
> .git/rebase-apply/patch:22: new blank line at EOF.
> +

Thanks yes looks like an extra empty line added to Kconfig.

Regards,

Tony

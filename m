Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 161633A0F98
	for <lists+linux-omap@lfdr.de>; Wed,  9 Jun 2021 11:26:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237997AbhFIJ2Q (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 9 Jun 2021 05:28:16 -0400
Received: from mail.kernel.org ([198.145.29.99]:58812 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233736AbhFIJ2P (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Wed, 9 Jun 2021 05:28:15 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 344ED6124B;
        Wed,  9 Jun 2021 09:26:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1623230769;
        bh=1EUr41rKGkCM5/wBbgTiWRS0jD4vY04IL1RUBmNla7U=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=o2YHMP1GmPI4I03++anWVSQlpSJW1rOn5+8Y0wO/u+GoK4mAPn2yYHW3mNMFE12Y2
         pRvOue8aTv5YziNxmi4pwO1BYYJhJ9KcEzo5qe7hXHzr0Un3LQzr7JoVzHDB98O6l0
         nMEbOc9VT3BuWFVUsB9gbNQAXbkBktA6IAwDWueo=
Date:   Wed, 9 Jun 2021 11:26:07 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Tony Lindgren <tony@atomide.com>
Cc:     Bin Liu <b-liu@ti.com>, linux-usb@vger.kernel.org,
        linux-omap@vger.kernel.org,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Andreas Kemnade <andreas@kemnade.info>,
        Bhushan Shah <bshah@kde.org>,
        Drew Fustini <drew@beagleboard.org>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH 1/2] usb: musb: Simplify cable state handling
Message-ID: <YMCJL7KXI1GxwQBl@kroah.com>
References: <20210604080536.12185-1-tony@atomide.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210604080536.12185-1-tony@atomide.com>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Fri, Jun 04, 2021 at 11:05:35AM +0300, Tony Lindgren wrote:
> Simplify cable state handling a bit to leave out duplicated code.
> We are just scheduling work and showing state info if a recheck is
> needed. No intended functional changes.
> 
> Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
> Cc: Andreas Kemnade <andreas@kemnade.info>
> Cc: Bhushan Shah <bshah@kde.org>
> Cc: Drew Fustini <drew@beagleboard.org>
> Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> Signed-off-by: Tony Lindgren <tony@atomide.com>
> ---
>  drivers/usb/musb/musb_core.c | 40 ++++++++++++++++++------------------
>  1 file changed, 20 insertions(+), 20 deletions(-)

Does not apply to my usb-next branch, what tree/branch did you make this
against?

thanks,

greg k-h

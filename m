Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2B9AF1C1FAB
	for <lists+linux-omap@lfdr.de>; Fri,  1 May 2020 23:31:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726272AbgEAVbP (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 1 May 2020 17:31:15 -0400
Received: from muru.com ([72.249.23.125]:52594 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726045AbgEAVbP (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Fri, 1 May 2020 17:31:15 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id D85DF810E;
        Fri,  1 May 2020 21:32:02 +0000 (UTC)
Date:   Fri, 1 May 2020 14:31:11 -0700
From:   Tony Lindgren <tony@atomide.com>
To:     Pavel Machek <pavel@denx.de>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Johan Hovold <johan@kernel.org>, Rob Herring <robh@kernel.org>,
        Alan Cox <gnomes@lxorguk.ukuu.org.uk>,
        Lee Jones <lee.jones@linaro.org>, Jiri Slaby <jslaby@suse.cz>,
        Merlijn Wajer <merlijn@wizzup.org>,
        Peter Hurley <peter@hurleysoftware.com>,
        Sebastian Reichel <sre@kernel.org>,
        linux-serial@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org
Subject: Re: [PATCH 1/6] tty: n_gsm: Add support for serdev drivers
Message-ID: <20200501213111.GF37466@atomide.com>
References: <20200430174615.41185-1-tony@atomide.com>
 <20200430174615.41185-2-tony@atomide.com>
 <20200501203130.GC6043@duo.ucw.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200501203130.GC6043@duo.ucw.cz>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Pavel Machek <pavel@denx.de> [200501 20:32]:
> > +static struct gsm_dlci *gsd_dlci_get(struct gsm_serdev *gsd, int line,
> > +				     bool allocate)
> > +{
> > +	struct gsm_mux *gsm;
> > +	struct gsm_dlci *dlci;
> > +
> > +	if (!gsd || !gsd->gsm)
> > +		return ERR_PTR(-ENODEV);
> > +
> > +	gsm = gsd->gsm;
> > +
> > +	if (line < 1 || line >= 63)
> > +		return ERR_PTR(-EINVAL);
> > +
> > +	mutex_lock(&gsm->mutex);
> ...
> > +	dlci = gsm_dlci_alloc(gsm, line);
> > +	if (!dlci) {
> > +		gsm = ERR_PTR(-ENOMEM);
> > +		goto unlock;
> 
> dlci = , or you get nice crash.

Ah thanks yeah we return dlci and need to set dlci instead:

	if (!dlci) {
		dlci = ERR_PTR(-ENOMEM);
		goto unlock;
	}

Regards,

Tony

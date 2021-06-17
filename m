Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D48C23AB1B7
	for <lists+linux-omap@lfdr.de>; Thu, 17 Jun 2021 12:57:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232094AbhFQK7f (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 17 Jun 2021 06:59:35 -0400
Received: from mail.kernel.org ([198.145.29.99]:49232 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231279AbhFQK7f (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Thu, 17 Jun 2021 06:59:35 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5136961027;
        Thu, 17 Jun 2021 10:57:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1623927447;
        bh=IOLXRmg80R/OU5e3aquf/aBP/w6TFTssC0a1ZsufaBE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=TPlg5Wc/RxKgHEl1up2Fz/iVJ91x7qOxxX4mM+GJ16SvC4RMKwYnw4X3ChgWjl2Fs
         Uaj6YIViwFXCBIBAlKiNr2D1D/huDd7WzT8lHAV0tMAoJWGyxumolOoDVIMr6xIZUd
         hmKopnh6JO/rofkgakPk+guzigeSt6MK5BaQ1dC0=
Date:   Thu, 17 Jun 2021 12:57:24 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Laurentiu Tudor <laurentiu.tudor@nxp.com>
Cc:     Lee Jones <lee.jones@linaro.org>, linux-kernel@vger.kernel.org,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        German Rivera <German.Rivera@freescale.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-omap@vger.kernel.org,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Stuart Yoder <stuyoder@gmail.com>,
        Tony Lindgren <tony@atomide.com>
Subject: Re: [PATCH 00/10] Rid W=1 warnings from Bus
Message-ID: <YMsqlAywR2toXd+3@kroah.com>
References: <20210526081038.544942-1-lee.jones@linaro.org>
 <74eb170b-348b-1bba-432c-52c9541b05fe@nxp.com>
 <YMsajH2uxw4RHPeF@dell>
 <1711c37d-19d3-b923-d02a-433586c951ee@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1711c37d-19d3-b923-d02a-433586c951ee@nxp.com>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Thu, Jun 17, 2021 at 01:11:39PM +0300, Laurentiu Tudor wrote:
> 
> 
> On 6/17/2021 12:49 PM, Lee Jones wrote:
> > On Wed, 26 May 2021, Laurentiu Tudor wrote:
> > 
> >> Hi Lee,
> >>
> >> On 5/26/2021 11:10 AM, Lee Jones wrote:
> >>> This set is part of a larger effort attempting to clean-up W=1
> >>> kernel builds, which are currently overwhelmingly riddled with
> >>> niggly little warnings.
> >>>
> >>> Lee Jones (10):
> >>>   bus: fsl-mc: mc-io: Supply function names for 'fsl_create_mc_io()' and
> >>>     'fsl_destroy_mc_io()'
> >>>   bus: fsl-mc: mc-sys: Supply missing function names in kernel-doc
> >>>     headers
> >>>   bus: fsl-mc: fsl-mc-bus: Demote a bunch of non-conformant kernel-doc
> >>>     headers and help others
> >>>   bus: fsl-mc: dprc: Fix a couple of misspelling and formatting issues
> >>>   bus: fsl-mc: dprc-driver: Fix some missing/incorrect function
> >>>     parameter descriptions
> >>>   bus: fsl-mc: fsl-mc-allocator: Fix misspelling of 'new_mc_adev' and
> >>>     demote non-kernel-doc headers
> >>>   bus: qcom-ebi2: Fix incorrect documentation for '{slow,fast}_cfg'
> >>>   bus: fsl-mc-msi: Fix a little doc-rot pertaining to 'np' to 'fwnode'
> >>>     conversion
> >>>   bus: ti-sysc: Correct misdocumentation of 'sysc_ioremap()'
> >>>   bus: fsl-mc: mc-io: Correct misdocumentation of 'dpmcp_dev' param
> >>>
> >>>  drivers/bus/fsl-mc/dprc-driver.c      |  8 +++++---
> >>>  drivers/bus/fsl-mc/dprc.c             |  4 ++--
> >>>  drivers/bus/fsl-mc/fsl-mc-allocator.c | 10 +++++-----
> >>>  drivers/bus/fsl-mc/fsl-mc-bus.c       | 19 ++++++++++---------
> >>>  drivers/bus/fsl-mc/fsl-mc-msi.c       |  2 +-
> >>>  drivers/bus/fsl-mc/mc-io.c            |  6 +++---
> >>>  drivers/bus/fsl-mc/mc-sys.c           | 19 ++++++++++---------
> >>
> >> Thanks for this. For drivers/bus/fsl-mc/*:
> >>
> >> Reviewed-by: Laurentiu Tudor <laurentiu.tudor@nxp.com>
> > 
> > Any idea who will take the 'fsl-mc' patches please?
> > 
> 
> Usually GregKH (added in the thread) picks them up through his char-misc
> tree.

If you resend just the fsl-mc patches as a series, I can pick them up
that way.  Otherwise trying to pick out individual ones here is pretty
much impossible...

thanks,

greg k-h

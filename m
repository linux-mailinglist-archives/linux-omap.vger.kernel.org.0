Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CE93766B388
	for <lists+linux-omap@lfdr.de>; Sun, 15 Jan 2023 19:55:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231372AbjAOSzm (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sun, 15 Jan 2023 13:55:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41992 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231362AbjAOSzk (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Sun, 15 Jan 2023 13:55:40 -0500
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com [IPv6:2607:f8b0:4864:20::102a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BEC74113E2
        for <linux-omap@vger.kernel.org>; Sun, 15 Jan 2023 10:55:38 -0800 (PST)
Received: by mail-pj1-x102a.google.com with SMTP id o13so23628811pjg.2
        for <linux-omap@vger.kernel.org>; Sun, 15 Jan 2023 10:55:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=E/pIHLcTGynOgEpdPeeKhsxmrKRBFk6UXJb6cNW02Kw=;
        b=F7/sClmojEcKOK4wWQbXO2f3G9Dc1dPVQu1p+HAfxzg+yhqaDzV3oOSA0BJoAhRtgK
         12GwVOdKfGCT1JvdmVci6PrV9BJuYwufg+c3yM3LY4Mi/nliw+ysUuxzaRLiKJdXkyz7
         IXDCcLRbPD6ZNFEfrOI+qTRPfOFe2u/GGAvxOgUPtHbxs+rCoWFwFJhjOcKEuS8kODb6
         tQMzVfcaLZn3Nbytbcvtns7IJcyJMy21dx9SOUl9Og4eDdrkX57FtpG/NvJIa3yrur3Y
         pi/d3iy0vNkXXSrDpeXVM/fJAgStOb7c/n2/Us1sReEL9N+XUXF2MbNHV4tqC4/M/tXy
         ARkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=E/pIHLcTGynOgEpdPeeKhsxmrKRBFk6UXJb6cNW02Kw=;
        b=6ATZU/1G/xDv+DTh+dODw/XBsfsQLolJBoIT5h+Cokx+CrUVG+PznhBWbLjxyTAaiq
         0ow4Df/2fvL/PGH4ob8vvz11daIMSl0obGmB23r+MWhUK/RzHndalM8yHbo1fY+eiX3H
         Ydh3F1ZEi7WyEwBT2ZBGVbWU1GE3L4bQl8q0gJjtBQyNEilQxz9tRS4o522StTQ0R2AH
         6XAdlJiWwcGDZMNG4iEkQGXYwXmpl2P6ikA1/E3I/ikZPlvJ0/OFKGqu5Z3PSxfReXqL
         EUkkJ6+JA080+ZnvRMwpco/MrY6O1wFeUucXwfA5oohMF6pQn2Ylj0pZJ1lbxcR6nwE+
         rkFA==
X-Gm-Message-State: AFqh2kqPVrX7kAPMlY+9ZKKYV27wRe782rD+JCz8tYCGoboHnAbgrMmL
        w5IrzMxzPhfcf8bi/NokiZQdrs/Z4hF7fY6XOyo=
X-Google-Smtp-Source: AMrXdXvVbeIhLiDYK9lmjcFFBWUdXCSMLkwMqwkG1hyiWdU02H6/ygkbdrW6479miRSGH4T80EBKcZXqdMtTd5jxTbY=
X-Received: by 2002:a17:90b:2548:b0:219:de90:bdc4 with SMTP id
 nw8-20020a17090b254800b00219de90bdc4mr7563588pjb.18.1673808937955; Sun, 15
 Jan 2023 10:55:37 -0800 (PST)
MIME-Version: 1.0
References: <CAHCN7xJT+1XP-LHyzj0GB5rDnVP+EgGmUVb6h4uTJA4bVE1yPg@mail.gmail.com>
 <5DD8AC17-A7FD-4D44-953E-F2EF84C6896D@messlink.de> <CAHCN7xJZgy1HKp-sHtqZeKAa2uKFtLLGeEguJoZRB+RswEfgJg@mail.gmail.com>
 <CAHCN7xLrDGMNKyXw6Eb9LJSHm_wDF2N3PjDKUtZ6LKTvQOxfFw@mail.gmail.com> <Y7us8Ann7tjJ5lcn@atomide.com>
In-Reply-To: <Y7us8Ann7tjJ5lcn@atomide.com>
From:   Adam Ford <aford173@gmail.com>
Date:   Sun, 15 Jan 2023 12:55:26 -0600
Message-ID: <CAHCN7x+EaXd3cR-0pUnjwDJAWqyb6Oamrh9HJyskpmLJfMobqw@mail.gmail.com>
Subject: Re: omap_hsmmc RX DMA errors
To:     Tony Lindgren <tony@atomide.com>
Cc:     "H. Nikolaus Schaller" <hns@messlink.de>,
        Linux-OMAP <linux-omap@vger.kernel.org>,
        Discussions about the Letux Kernel 
        <letux-kernel@openphoenux.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Sun, Jan 8, 2023 at 11:58 PM Tony Lindgren <tony@atomide.com> wrote:
>
> Hi,
>
> * Adam Ford <aford173@gmail.com> [230105 19:20]:
> > On Thu, Jan 5, 2023 at 1:08 PM Adam Ford <aford173@gmail.com> wrote:
> > > On Thu, Jan 5, 2023 at 12:17 PM H. Nikolaus Schaller <hns@messlink.de> wrote:
> > > > Am 05.01.2023 um 18:54 schrieb Adam Ford <aford173@gmail.com>:
> > > >
> > > > Would there be an objection if I migrate the OMAP3.dtsi file to the
> > > > newer driver?  I wasn't sure if there was a reason this family was
> > > > being held back from the newer driver.
> > > >
> > > >
> > > > AFAIR Tony wanted to retire the older driver anyways.
> > >
> > > That was my impression and it appears that the AM35x has already
> >
> > correction AM335x (not AM35x)
> >
> > > migrated to it.  I wasn't sure what was holding us back.  In theory,
> > > we could add the compatible flags to the new driver and mark them as
> > > deprecated so the new driver would work with older device trees if
> > > there was push-back on changing the device trees.  I know sometimes
> > > there are concerns about using older device trees and the interaction
> > > with the compatible flags make it a bit more complex.
>
> Things should be ready to flip the remaining SoCs to use sdhci so we
> should do that.

Do you want me to push a patch?  It might bring more clout if it comes
from you, but I don't mind. If so, how do we handle the backwards
compatibility stuff with older device trees?
>
> The only thing I'm aware of is that sdhci will try to keep probing
> also mmc instances that are not wired. So some board specific dts files
> may need to set some mmc instances with status = "disabled". Or maybe
> the sdhci driver can be configured to stop trying after some timeout.

I have not seen this as being an issue on the AM35 I have.

adam
>
> Regards,
>
> Tony

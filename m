Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 21A8EC9148
	for <lists+linux-omap@lfdr.de>; Wed,  2 Oct 2019 21:04:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728786AbfJBTEG (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 2 Oct 2019 15:04:06 -0400
Received: from mail-io1-f68.google.com ([209.85.166.68]:34657 "EHLO
        mail-io1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726076AbfJBTEF (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 2 Oct 2019 15:04:05 -0400
Received: by mail-io1-f68.google.com with SMTP id q1so59542510ion.1;
        Wed, 02 Oct 2019 12:04:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=St/5Yx9IAdho5qVopBMcN0+NvHaC/UJiWRlETASobFI=;
        b=kaUlL3j6+0GmaCUe6vpBY5PoTGdlqVWCuZBArGh4SbLS0unPdcxIETP2WXDtya3J/7
         Pk9jW8ioH0dWaNgAUdcsqjSe+ptGhqMISbLg5dm+hvb2S+u4qcUVzhr7JGR/hZWaA3Tl
         aXOf2pISMsJzFG4lPCx/mZi0cditrZ3P6CdICEdcy25sACwFF9VVvPYz+D8H5IZNf+zk
         wH9Sj8+S7I2eWwhlTFkk9rL3mkHlmq7nkou3hRNkTXV6lADFcrRg59W1EymyGTJkhzZW
         PHG8mN8uvM3vyGO4Cki8S/OHDQPNUuwvGsQDV+DUOF9zHFcrVJJ6ayS4j3yml5T2RHr/
         RgtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=St/5Yx9IAdho5qVopBMcN0+NvHaC/UJiWRlETASobFI=;
        b=LoB6OUaFeI6sDHNdbS0CsMOzJ2agxfMQBPilN3iJ2ruNoVYG18GNajwBkCEswu269W
         FSC5oeU0lcDTPSXLdseU3xJasMkweWldA5me7XMiX0ZiDxKqcBE8E8rI7xhhK27s8sH6
         R5Kiu6S/B3wUeeRMvRNWaQV8Tio9zen+1YdPvCjSR2gsqk21uq5z3X0IL2ihZQLaVjum
         VPliQyMmqf58ru58hzf/u19wOZIlgcteHjFfMEPu99QZAEQ37UPmGW0671/3fOI28W7e
         kKeFQBAFF/YDbMPtfBTTs4j3jxN08A7tJ8QzJ9N5dF0H5HYJSXXci9RaxmgNJxScgOlE
         TPZw==
X-Gm-Message-State: APjAAAWAbaiUygYbsXNDl0CdU/MPe91X2g4OIZe2Rj3uqcZUdqRBLR9y
        obmDnWTZH8kx3L7X3cQnSGtfO1sPeviGdhTetL4=
X-Google-Smtp-Source: APXvYqyBDRqzCOURp0bIg87hcNlK+OwvFnOdUWlJtXBAuGTiO64hQFSh/cP5qStkleVFnxHHNCRKAk8bKbmsvDUw5BU=
X-Received: by 2002:a92:3314:: with SMTP id a20mr5448246ilf.276.1570043044661;
 Wed, 02 Oct 2019 12:04:04 -0700 (PDT)
MIME-Version: 1.0
References: <20181221011752.25627-1-sre@kernel.org> <4f47f7f2-3abb-856c-4db5-675caf8057c7@xs4all.nl>
 <20190319133154.7tbfafy7pguzw2tk@earth.universe>
In-Reply-To: <20190319133154.7tbfafy7pguzw2tk@earth.universe>
From:   Adam Ford <aford173@gmail.com>
Date:   Wed, 2 Oct 2019 14:03:52 -0500
Message-ID: <CAHCN7xLffcvC0LVnfrhf4cA=y1PRMx+COa3c8rBm1xOj179vEA@mail.gmail.com>
Subject: Re: [PATCH 00/14] Add support for FM radio in hcill and kill TI_ST
To:     Sebastian Reichel <sre@kernel.org>
Cc:     Hans Verkuil <hverkuil@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Tony Lindgren <tony@atomide.com>,
        Rob Herring <robh@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Pavel Machek <pavel@ucw.cz>,
        "open list:BLUETOOTH DRIVERS" <linux-bluetooth@vger.kernel.org>,
        linux-media@vger.kernel.org,
        Linux-OMAP <linux-omap@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Tue, Mar 19, 2019 at 8:33 AM Sebastian Reichel <sre@kernel.org> wrote:
>
> Hi Hans,
>
> On Thu, Mar 14, 2019 at 09:20:10AM +0100, Hans Verkuil wrote:
> > On 12/21/18 2:17 AM, Sebastian Reichel wrote:
> > > This moves all remaining users of the legacy TI_ST driver to hcill (patches
> > > 1-3). Then patches 4-7 convert wl128x-radio driver to a standard platform
> > > device driver with support for multiple instances. Patch 7 will result in
> > > (userless) TI_ST driver no longer supporting radio at runtime. Patch 8-11 do
> > > some cleanups in the wl128x-radio driver. Finally patch 12 removes the TI_ST
> > > specific parts from wl128x-radio and adds the required infrastructure to use it
> > > with the serdev hcill driver instead. The remaining patches 13 and 14 remove
> > > the old TI_ST code.
> > >
> > > The new code has been tested on the Motorola Droid 4. For testing the audio
> > > should be configured to route Ext to Speaker or Headphone. Then you need to
> > > plug headphone, since its cable is used as antenna. For testing there is a
> > > 'radio' utility packages in Debian. When you start the utility you need to
> > > specify a frequency, since initial get_frequency returns an error:
> >
> > What is the status of this series?
> >
> > Based on some of the replies (from Adam Ford in particular) it appears that
> > this isn't ready to be merged, so is a v2 planned?
>
> Yes, a v2 is planned, but I'm super busy at the moment. I don't
> expect to send something for this merge window. Neither LogicPD
> nor IGEP use FM radio, so I can just remove FM support from the
> TI_ST framework. Converting those platforms to hci_ll can be done
> in a different patchset.
>

Sebastian,

After a bunch of testing, I think the issue I was having was the BTS
file being pulled in from linux-firmware.  I was able to successfully
load a BTS file that I have from Logic PD with working BLE and BT
working together.  I have to run some tests, but if you wouldn't mind
re-basing your code and pushing it again for review, I can most likely
add my 'tested-by'
I am not sure who to discuss my perceived bug in the BTS blob.  I have
to go find the old BTS editor and see if I can determine the cause,
but the fact that I can use the BTS file that corresponds to the FCC
certified file that Logic PD used is more important to me than using
the generic BTS file provided by TI, however it would be nice for the
reference BTS file to operate without error.

adam
> If that was the only issue there would be a v2 already. But Marcel
> Holtmann suggested to pass the custom packet data through the BT
> subsystem, which is non-trivial (at least for me) :)
>
> -- Sebastian

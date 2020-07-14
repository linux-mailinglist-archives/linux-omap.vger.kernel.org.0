Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7F07021E8EE
	for <lists+linux-omap@lfdr.de>; Tue, 14 Jul 2020 09:03:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726062AbgGNHD0 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 14 Jul 2020 03:03:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41476 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725788AbgGNHD0 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 14 Jul 2020 03:03:26 -0400
Received: from mail-io1-xd43.google.com (mail-io1-xd43.google.com [IPv6:2607:f8b0:4864:20::d43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D47CCC061755;
        Tue, 14 Jul 2020 00:03:25 -0700 (PDT)
Received: by mail-io1-xd43.google.com with SMTP id v6so16225665iob.4;
        Tue, 14 Jul 2020 00:03:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=MT7cYYrcM99DVBuXFRqZwFieQfngoQCFo5QcPTP5JIU=;
        b=UuwneiRc0rQ4ddykmcV5x4aFSBSVHiADlOmVLt+KR1OpoPshajKUwgnvFAcpGSrxl5
         3pGRlh9s4/86E31cbcNuVMogV6sdDS0rQj9+cA323xxXwYQ2hwNUSV5bssL2w7/SprQh
         LfMbP5OsgkMYdGRiIZ9q852VoxNxtbKbnzYYVH3B0n6NEnmzVC0nq3KggJDS3YpBUD/D
         uSvQAEGqc+9ZQzGfzNnvPhpcUtDYw46nzAPxSh+QM/jD8uclpmT76WFgIZJpYQH6XNvq
         3kwsabONEMBcGjzDzWzgUtPlslAtkKMXs9vFaVg91F6Cfbc077ix/IxSewKrczxN4Yj5
         9WRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=MT7cYYrcM99DVBuXFRqZwFieQfngoQCFo5QcPTP5JIU=;
        b=f/ch9BlkP3qJNsq2T8fHqnaHjm2tJll2qLzZqYx594cYJ+wAaDjSwO+f1biTQoGzPY
         fgoQ9epWjnCkbdiCbGropF/oYCuK1djvG6bqoCkbiNQSpCOTpo76iw7d/TeYf9zwDU7E
         xi/O9BOUZWAyByRRD/5YMBvsx9aBr3p4crfbWZRu5kUdmfE1JwzYfTmga8RziIR12PCK
         t3JJIu3oPzet8iuaLjj97Ag3gTcfNzOPrUtjBpBY4vTO8F+7azIKj5oNW27aNNZpcjoN
         Ngu2Bi1APVv/DFX/i0nlbBJ4TAZ75d9kVhmvqtx2GHnIRMAC4tOaeiskNEvFVJAtvjWO
         lvjw==
X-Gm-Message-State: AOAM532ZbrIGPU7SPgxx6agSuaTb69ZyigFiEJgdzUCdkJT9l3ASalod
        DvYcRLtzzZpU4XYpbcCOy5MutxWJKUd9qbfSppo=
X-Google-Smtp-Source: ABdhPJx/68mFEtDU4FvSbKmhgpZcJ/ThBF5GsLgMTXMMX9bc0cLIFg2GtR0zDMn4VLvb+UyjQcuz6KcG9QXNXo3MMi4=
X-Received: by 2002:a05:6638:601:: with SMTP id g1mr4378444jar.137.1594710205319;
 Tue, 14 Jul 2020 00:03:25 -0700 (PDT)
MIME-Version: 1.0
References: <1594708507-6794-1-git-send-email-dillon.minfei@gmail.com>
 <1594708507-6794-2-git-send-email-dillon.minfei@gmail.com> <20200714164504.10b23697@canb.auug.org.au>
In-Reply-To: <20200714164504.10b23697@canb.auug.org.au>
From:   dillon min <dillon.minfei@gmail.com>
Date:   Tue, 14 Jul 2020 15:02:49 +0800
Message-ID: <CAL9mu0KRc1qNvW4xJj0cn_PoaumCnfdFVoneHja_B+2DPoRTSw@mail.gmail.com>
Subject: Re: [PATCH v4] Fix dcan driver probe failed on am437x platform
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Benoit Cousson <bcousson@baylibre.com>, tony@atomide.com,
        Rob Herring <robh+dt@kernel.org>, linux-omap@vger.kernel.org,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi Stephen,

Thanks for your patience, step by step help on my patch reviewing.

Dillon,

On Tue, Jul 14, 2020 at 2:45 PM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Hi Dillon,
>
> > Hi Stephen,
> >
> > This changes correct commit messages based on your reviewing.
> > make Fixes tags to oneline.
> > make all commit message tags at the end of commit message
> > make Fixes tags before Signed-off-by line.
> > add probe failed log to commit message.
>
> Thanks for persisting.  It looks good to me, now.
>
> --
> Cheers,
> Stephen Rothwell

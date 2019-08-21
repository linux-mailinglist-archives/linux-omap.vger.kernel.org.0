Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D023F97B3E
	for <lists+linux-omap@lfdr.de>; Wed, 21 Aug 2019 15:50:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728737AbfHUNt4 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 21 Aug 2019 09:49:56 -0400
Received: from mail-io1-f54.google.com ([209.85.166.54]:37339 "EHLO
        mail-io1-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727949AbfHUNt4 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 21 Aug 2019 09:49:56 -0400
Received: by mail-io1-f54.google.com with SMTP id q22so4659996iog.4
        for <linux-omap@vger.kernel.org>; Wed, 21 Aug 2019 06:49:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=wB8vN7FmDcjgoHacBeyOHsAx7b4SBzFxHJ7/vQLTiGA=;
        b=IIxCipYIZCwcngzqZUpEvxSJrp6YmCyEiOmCGECUNSJVNEwreV/TiCIBBOOU7OXRIM
         RSbWSgf5imUi7t6c4harlF0i4tDq7KgnvfyigMOE/S07kmo4bp/wB9hz2ceWTyq09tql
         +QdZXQ6EB0+VBqOoA5IQFeoGAy60KsuXB9DchCYNK1jp/b/DBYwuWNDWVzlib99Wk1yM
         aBwjqolhZTmiD4LtXh0y0HgYE82TMM+bWa5HsfUA36qJx3bQSOas42Y5tytcVPqzxquB
         U4zPHfdyPhRayTWrR9hPA0i5RFq3XuDjXaNdsZKJFc0ew9eVqQt8huqxewHbZmVffCCr
         KFlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=wB8vN7FmDcjgoHacBeyOHsAx7b4SBzFxHJ7/vQLTiGA=;
        b=LtH1ohzISxD753zvk0fVTAtoCC6fUtaSaAsQtWfrpQkjWXpds2PCehtBw0a6+89pTD
         HdM+WfkvZuHiixhqGSCTpdla0OxgRoL6FrAr6PCtdJCKVcVJcGUQTyxO/U14yXRh4c//
         Nj5isw3mxgmNgxjIdfnAvLBHASApeNkoBx9JCLUrWduPw1laN72jxxRuOBady5m8rq0y
         vi8jGsSNPV2WdSLtwRw+ZUT1tKKR6uoySW4lHFbPXXh7P26KyjuNj6lCSDZ/l0whLiYB
         31XhqOxiS7rF1FvH/ngEgQAxjzPAwgDUf2v68y12TtFFTf55VESdycTwHm4uttgR9vfX
         ZhQQ==
X-Gm-Message-State: APjAAAWvOGzauKUo+TDsy6ApEHF0KR6VKu1Z+BgD1IDze4vkHdj4feqm
        SnYTlM1sraysa1UPHg8nym4pmwvuU9XBsxF5X0XBXOQO1sQ=
X-Google-Smtp-Source: APXvYqwvUWY4tGSLQU6GHAs5nsD/PCnyVl9vkvBTWPlA32c9Ok+jplgxKWN/gqqBT/qI/w1aJTtNbouEAz0tTs/EBwA=
X-Received: by 2002:a05:6602:2195:: with SMTP id b21mr5252170iob.205.1566395395394;
 Wed, 21 Aug 2019 06:49:55 -0700 (PDT)
MIME-Version: 1.0
References: <CAHCN7xKmQmGBig0k+gwdMax8ojoR+B3aowDOu1FyiNM3gvypKg@mail.gmail.com>
 <20190821113759.GO52127@atomide.com>
In-Reply-To: <20190821113759.GO52127@atomide.com>
From:   Adam Ford <aford173@gmail.com>
Date:   Wed, 21 Aug 2019 08:49:43 -0500
Message-ID: <CAHCN7xJFGuogTXkVuEorNhXwwTVKHUrH8y9YrgTLi86peCYbUQ@mail.gmail.com>
Subject: Re: wl1271 broken on am3517-evm on for-next
To:     Tony Lindgren <tony@atomide.com>
Cc:     Linux-OMAP <linux-omap@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Wed, Aug 21, 2019 at 6:38 AM Tony Lindgren <tony@atomide.com> wrote:
>
> * Adam Ford <aford173@gmail.com> [190821 00:06]:
> > Tony,
> >
> > I noticed the AM3517-evm gets a bunch of splat when loading the wlcore
> > and 80211 stuff.  It appears to be limited to your for-next branch.  I
> > haven not bisected it, but before I did, I wanted to see if you were
> > aware of anything.  If not, I'll work on bisecting it.  I just didn't
> > want to waste time if you had any ideas first.
>
> Hmm not sure why anything in my for-next would affect am3517? Maybe
> something is broken in v5.3-rc1 that my for-next is based on.

The problem exists in v5.3-rc1 (not just your for-next), but it
appears to be resolved in 5.3-rc5, so I'm going hold back any further
testing.  I applied the changes in for-next to rc5, and I am still not
seeing an issue.


>
> Also, please test (again) with level wlcore interrupt instead of
> edge. We recent gpio-omap fixes it's starting to look that we can
> still have edge interrupts lost in retention idle with no status
> to be seen in the gpio controller. So anything that can be treated
> as level interrupt probaby should be.

Currently, it it setup as
interrupts = <10 IRQ_TYPE_EDGE_RISING>; /* gpio_170 */

Are you suggesting we go back to
interrupts = <10 IRQ_TYPE_LEVEL_HIGH>; /* gpio_170 */

adam

>
> Regards,
>
> Tony

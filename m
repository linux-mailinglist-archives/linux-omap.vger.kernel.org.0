Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0852119E30
	for <lists+linux-omap@lfdr.de>; Fri, 10 May 2019 15:29:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727606AbfEJN3F (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 10 May 2019 09:29:05 -0400
Received: from mail-it1-f196.google.com ([209.85.166.196]:35803 "EHLO
        mail-it1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727247AbfEJN3E (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 10 May 2019 09:29:04 -0400
Received: by mail-it1-f196.google.com with SMTP id u186so9175446ith.0;
        Fri, 10 May 2019 06:29:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=tEI9sf8s6CbiYTZhinc6UaZKY3nXguWNObTRgvPsffM=;
        b=MKLC6fFeMMNFlxLJm1qDPzi/olxy7mWKyhC4XwwLqyBjXhuidBs38mAWHI8UFRB9BB
         Z5KsEEUaF5Gbi4PMSAVYNllV+134u3zlYqmoXWHzcmItQmy/JD/9ep9FwkHWJbOvvSO/
         js2Lxdtum8wIalNl0T17XkQcCt9Ha+NGcHa6rF/yptT0Ekt46+laq0nY48yJ59bDS5dw
         bzDu1uUrblxcrBAB2IcZsojYCTUTIo+lsNEthY79ocauJ2Vv3DseLum1nKYNuvN6E6aB
         VrzIxBHGTz4FjB9f+Te4Be4cY7mVDwltqP1ija8h8IS+t1q4MYELIK1acjaTzcrf2id8
         Hiow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=tEI9sf8s6CbiYTZhinc6UaZKY3nXguWNObTRgvPsffM=;
        b=PZYmET0GXzFaRg8MB3SGGVm3gtNu6jfdnVFF5soJLC7mQAc75fa8SBAT5/nKPMolWQ
         qNT75nNBeN9JpKvHvxtm2G5KXKBFQHe69qOkJd42UpaSLV0ww8tfp7xp0rS1gSzvxyAo
         azU3vtOfeFVVKBykLFvZVLG1wPjWN05cWdHmmStIZvHr98N4iOhhIMUYidodk4gE239q
         AlUCd4fQTtuqDCslQwBQ+GkMymUTT1/mxTJR5TQLufpJTe4k4MmUH1EcQixSHYVpcVfs
         pZT2H3p9+fJ1nGYSBHQ5Fg2/j6SP0f8WPFHAFpH5bZrg+r3V2RNzfHtSd2aBnBaGaplL
         MsWw==
X-Gm-Message-State: APjAAAVOTzG6o2PjOxkSHCVRttb6hCNOsiONLK9B7jC34Oeei2Fpdd+m
        rMd9+6XlrzXO54MhpdoaBFHEn/2V0LjNAIWYsDw=
X-Google-Smtp-Source: APXvYqwfD517a0sqCt8zRC0swAkSFTZ4O5J/Aykr/0rp0fbxJ/7CpCNvGVWvAwLspNf49q3MF5lLhY/ndxNGki3BYCA=
X-Received: by 2002:a24:4415:: with SMTP id o21mr2980847ita.143.1557494943235;
 Fri, 10 May 2019 06:29:03 -0700 (PDT)
MIME-Version: 1.0
References: <20181221011752.25627-1-sre@kernel.org> <4f47f7f2-3abb-856c-4db5-675caf8057c7@xs4all.nl>
 <20190319133154.7tbfafy7pguzw2tk@earth.universe> <CAHCN7xLZFLs=ed539bwuT6s-n6SDof-um7B3AeErQ2ChztC26A@mail.gmail.com>
 <CAHCN7xLQ=h3bfwS=uTfjSpOtv9qWbic0=_51WJz9KmX7v8+vmw@mail.gmail.com> <FCCA9B3E-80AD-416E-B6E4-85E90721881E@holtmann.org>
In-Reply-To: <FCCA9B3E-80AD-416E-B6E4-85E90721881E@holtmann.org>
From:   Adam Ford <aford173@gmail.com>
Date:   Fri, 10 May 2019 08:28:51 -0500
Message-ID: <CAHCN7x+2t++EifqQ17kyzW0=NnnQ4A1HeFvE4pEzJ02cXwy+LA@mail.gmail.com>
Subject: Re: [PATCH 00/14] Add support for FM radio in hcill and kill TI_ST
To:     Marcel Holtmann <marcel@holtmann.org>
Cc:     Sebastian Reichel <sre@kernel.org>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Tony Lindgren <tony@atomide.com>,
        Rob Herring <robh@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Pavel Machek <pavel@ucw.cz>,
        "open list:BLUETOOTH DRIVERS" <linux-bluetooth@vger.kernel.org>,
        linux-media@vger.kernel.org,
        Linux-OMAP <linux-omap@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Wed, May 8, 2019 at 3:58 PM Marcel Holtmann <marcel@holtmann.org> wrote:
>
> Hi Adam,
>
> >>>>> This moves all remaining users of the legacy TI_ST driver to hcill =
(patches
> >>>>> 1-3). Then patches 4-7 convert wl128x-radio driver to a standard pl=
atform
> >>>>> device driver with support for multiple instances. Patch 7 will res=
ult in
> >>>>> (userless) TI_ST driver no longer supporting radio at runtime. Patc=
h 8-11 do
> >>>>> some cleanups in the wl128x-radio driver. Finally patch 12 removes =
the TI_ST
> >>>>> specific parts from wl128x-radio and adds the required infrastructu=
re to use it
> >>>>> with the serdev hcill driver instead. The remaining patches 13 and =
14 remove
> >>>>> the old TI_ST code.
> >>>>>
> >>>>> The new code has been tested on the Motorola Droid 4. For testing t=
he audio
> >>>>> should be configured to route Ext to Speaker or Headphone. Then you=
 need to
> >>>>> plug headphone, since its cable is used as antenna. For testing the=
re is a
> >>>>> 'radio' utility packages in Debian. When you start the utility you =
need to
> >>>>> specify a frequency, since initial get_frequency returns an error:
> >>>>
> >>>> What is the status of this series?
> >>>>
> >>>> Based on some of the replies (from Adam Ford in particular) it appea=
rs that
> >>>> this isn't ready to be merged, so is a v2 planned?
> >>>
> >>> Yes, a v2 is planned, but I'm super busy at the moment. I don't
> >>> expect to send something for this merge window. Neither LogicPD
> >>> nor IGEP use FM radio, so I can just remove FM support from the
> >>> TI_ST framework. Converting those platforms to hci_ll can be done
> >>> in a different patchset.
> >>>
> >>> If that was the only issue there would be a v2 already. But Marcel
> >>> Holtmann suggested to pass the custom packet data through the BT
> >>> subsystem, which is non-trivial (at least for me) :)
> >>
> >> I am running some tests today on the wl1283-st on the Logic PD Torpedo
> >> board.  Tony had suggested a few options, so I'm going to try those.
> >> Looking at those today.  If/when you have a V2, please CC me on it. If
> >> it's been posted, can you send me a link?  I would really like to see
> >> the st-kim driver go away so I'd like to resolve the issues with the
> >> torpedo board.
> >
> > I have run a bunch of tests on the 5.1 kernel.  I am able to get the
> > firmware to load now and the hci0 goes up.  I was able to establish a
> > BLE connection to a TI Sensor Tag and read and write data to it with
> > good success on the wl1283.
> >
> > Unfortunately, when I tried to do some more extensive testing over
> > classic Bluetooth, I got an error that repeats itself at seemingly
> > random intervals:
> >      Bluetooth: hci0: Frame reassembly failed (-84)
> >
> > I can still scan and pair, but these Frame reassembly failed errors
> > appear to come and go.
>
> there are only 3 places in h4_recv_buf that return EILSEQ. Just add an ex=
tra printk to these to figure out which one it is. Maybe it is just extra p=
acket types that we need to handle. If it is not the packet type one, print=
 what packet we have that is causing this.
>

I added some code around

/* Check for invalid packet type */
    if (!skb) {
     printk("Check for invalid packet type %x\n", (unsigned int)
(&pkts[i])->type);
     return ERR_PTR(-EILSEQ);
}

I don't know if I did it right or I am reading the packet type
correctly, but the frame reassembly errors are being caught here.

[  408.519165] Check for invalid packet type ff
[  408.523559] Bluetooth: hci0: Frame reassembly failed (-84)


adam

> Regards
>
> Marcel
>

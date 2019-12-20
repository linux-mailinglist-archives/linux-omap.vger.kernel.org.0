Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D2FAF12847B
	for <lists+linux-omap@lfdr.de>; Fri, 20 Dec 2019 23:16:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727514AbfLTWQA (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 20 Dec 2019 17:16:00 -0500
Received: from mail-il1-f193.google.com ([209.85.166.193]:45107 "EHLO
        mail-il1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727478AbfLTWQA (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 20 Dec 2019 17:16:00 -0500
Received: by mail-il1-f193.google.com with SMTP id p8so9208824iln.12
        for <linux-omap@vger.kernel.org>; Fri, 20 Dec 2019 14:15:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=PvWa7xcnllmgFIQc5TjQdgByUUuzYx3n1hiBZ4AYta4=;
        b=hrMufeuc588g/HgbK0LCytUMm0WsbqweLxtriW77oNbPiw/MmW29qb3nVIlxDJYmNj
         oinggwU2fJ8dyX+5eQo1i7w7GQFvuelA6PS2q1+kh3lLOq19/+76Ob3Pkj4qmOz8q+wq
         k6pHEcSy/GQDx0MuWS0zlnUWE/W0OJMwhZ411utN6dsp1N9D0b/NW0j0cAZauMWvOa1M
         GshDLEwzCJIiB04QNgJmUHXVXawziFsB+laAsNfFpObfxHZsTf1AwBNZc03+Jdmg6La+
         0EtE1ODpS+JmqAcUi8sMZtWzOFynmvQH1S861bJXgG6gq9M5r34155lAP8LchHweDmnW
         ly5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=PvWa7xcnllmgFIQc5TjQdgByUUuzYx3n1hiBZ4AYta4=;
        b=s4gCCJK3Yu9a5v8mAb1ijLf68/Mp8Fc0Fsfq1Nz4tUzm4vw4VoEaJh7frfbPwYkX/M
         MMtReTJDIiRhvDsfG0IWQZxK8LYFpBdJgAZslqTE9hM5ZQXodnVpsQpsKWy6TsmS9Gw3
         3BcAyB/jwh5W3PL0KEB8sTVYfFRS7WkwRd/DJpi/vNXQUdtH/kS/vrmYCzPOWwFGg3wE
         8gv/HHqVMWWGFuj21+fgAobqQ2B0b0C21EhlSXM4eZQDQ27Wk+ZRqkRDk5ISw9b8T6HD
         AifYXD0+U5h57I/s/xP4U+6nKFXdiFZ34bVFKOvqIn8lqhqd5XtaLO7i1rw7pbqwusAB
         aO+A==
X-Gm-Message-State: APjAAAWA/T3Pe3AAQH6zLbNOvbLckQlUKY9FGfCcW5aut0HPHanpN1hz
        vdbLbHZoh8/tOu0y9vrDaWD5+uSC3WkeC8GYaipFmQ==
X-Google-Smtp-Source: APXvYqycc4aG9E6Qvaovr1YS1bIlYsuAdbLtDOGwS/ZRPnzwsubrAWHafZ0QFTre+brJ0Nd4jVeBIE1d4omx9cD33So=
X-Received: by 2002:a92:1547:: with SMTP id v68mr13877236ilk.58.1576880159104;
 Fri, 20 Dec 2019 14:15:59 -0800 (PST)
MIME-Version: 1.0
References: <20191213125537.11509-1-t-kristo@ti.com> <20191213125537.11509-6-t-kristo@ti.com>
 <20191218003815.GC16271@xps15> <5869498f-086c-cea4-edcf-1b75fb22cf22@ti.com>
 <CANLsYkz=ZV-AABXq2mSdwKkcdkQgFwStepteFnMBc4j=ahe4Dw@mail.gmail.com> <bd76da62-c9ad-2284-cf4b-8b0f02ed3e66@ti.com>
In-Reply-To: <bd76da62-c9ad-2284-cf4b-8b0f02ed3e66@ti.com>
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
Date:   Fri, 20 Dec 2019 15:15:48 -0700
Message-ID: <CANLsYkz1iJJP-SqkUqH64xqWKKF6m5=k=tZ16wiKEjTir4diAg@mail.gmail.com>
Subject: Re: [PATCHv3 05/15] remoteproc/omap: Add the rproc ops .da_to_va() implementation
To:     Suman Anna <s-anna@ti.com>
Cc:     Tero Kristo <t-kristo@ti.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        linux-remoteproc@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-omap@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Thu, 19 Dec 2019 at 19:34, Suman Anna <s-anna@ti.com> wrote:
>
> On 12/19/19 6:12 PM, Mathieu Poirier wrote:
> > On Thu, 19 Dec 2019 at 06:18, Tero Kristo <t-kristo@ti.com> wrote:
> >>
> >> On 18/12/2019 02:38, Mathieu Poirier wrote:
> >>> On Fri, Dec 13, 2019 at 02:55:27PM +0200, Tero Kristo wrote:
> >>>> From: Suman Anna <s-anna@ti.com>
> >>>>
> >>>> An implementation for the rproc ops .da_to_va() has been added
> >>>> that provides the address translation between device addresses
> >>>> to kernel virtual addresses for internal RAMs present on that
> >>>> particular remote processor device. The implementation provides
> >>>> the translations based on the addresses parsed and stored during
> >>>> the probe.
> >>>>
> >>>> This ops gets invoked by the exported rproc_da_to_va() function
> >>>> and allows the remoteproc core's ELF loader to be able to load
> >>>> program data directly into the internal memories.
> >>>>
> >>>> Signed-off-by: Suman Anna <s-anna@ti.com>
> >>>> Signed-off-by: Tero Kristo <t-kristo@ti.com>
> >>>> ---
> >>>>   drivers/remoteproc/omap_remoteproc.c | 39 ++++++++++++++++++++++++++++
> >>>>   1 file changed, 39 insertions(+)
> >>>>
> >>>> diff --git a/drivers/remoteproc/omap_remoteproc.c b/drivers/remoteproc/omap_remoteproc.c
> >>>> index 844703507a74..28f14e24b389 100644
> >>>> --- a/drivers/remoteproc/omap_remoteproc.c
> >>>> +++ b/drivers/remoteproc/omap_remoteproc.c
> >>>> @@ -232,10 +232,49 @@ static int omap_rproc_stop(struct rproc *rproc)
> >>>>      return 0;
> >>>>   }
> >>>>
> >>>> +/**
> >>>> + * omap_rproc_da_to_va() - internal memory translation helper
> >>>> + * @rproc: remote processor to apply the address translation for
> >>>> + * @da: device address to translate
> >>>> + * @len: length of the memory buffer
> >>>> + *
> >>>> + * Custom function implementing the rproc .da_to_va ops to provide address
> >>>> + * translation (device address to kernel virtual address) for internal RAMs
> >>>> + * present in a DSP or IPU device). The translated addresses can be used
> >>>> + * either by the remoteproc core for loading, or by any rpmsg bus drivers.
> >>>> + * Returns the translated virtual address in kernel memory space, or NULL
> >>>> + * in failure.
> >>>> + */
> >>>> +static void *omap_rproc_da_to_va(struct rproc *rproc, u64 da, int len)
> >>>> +{
> >>>> +    struct omap_rproc *oproc = rproc->priv;
> >>>> +    int i;
> >>>> +    u32 offset;
> >>>> +
> >>>> +    if (len <= 0)
> >>>> +            return NULL;
> >>>> +
> >>>> +    if (!oproc->num_mems)
> >>>> +            return NULL;
> >>>> +
> >>>> +    for (i = 0; i < oproc->num_mems; i++) {
> >>>> +            if (da >= oproc->mem[i].dev_addr && da + len <=
> >>>
> >>> Shouldn't this be '<' rather than '<=' ?
> >>
> >> No, I think <= is correct. You need to consider the initial byte in the
> >> range also. Consider a simple case where you provide the exact da + len
> >> corresponding to a specific memory range.
> >
> > For that specific case you are correct.  On the flip side if @da falls
> > somewhere after @mem[i].dev_addr, there is a possibility to clobber
> > the first byte of the next range if <= is used.
>
> Not really, you will miss out on the last byte actually if you use just
> <. This is just address range check, any memcpy would actually end one
> byte before.

I am indeed worried about actual memory accesses but rproc_da_to_va()
is using the same logic as you are when circling through carveouts.
As such you can forget about my comment.

Thanks,
Mathieu

>
> Eg: 0x80000 of len 0x10000. I should perfectly be able to copy 0x1000
> bytes at 0x8f000.
>
> regards
> Suman
>
>
> >
> > Thanks,
> > Mathieu
> >
> >>
> >>>
> >>>> +                oproc->mem[i].dev_addr +  oproc->mem[i].size) {
> >>>
> >>> One space too many after the '+' .
> >>
> >> True, I wonder why checkpatch did not catch this.
> >>
> >>>
> >>>> +                    offset = da -  oproc->mem[i].dev_addr;
> >>>
> >>> One space too many after then '-' .
> >>
> >> Same, will fix these two.
> >>
> >> -Tero
> >>
> >>>
> >>>> +                    /* __force to make sparse happy with type conversion */
> >>>> +                    return (__force void *)(oproc->mem[i].cpu_addr +
> >>>> +                                            offset);
> >>>> +            }
> >>>> +    }
> >>>> +
> >>>> +    return NULL;
> >>>> +}
> >>>> +
> >>>>   static const struct rproc_ops omap_rproc_ops = {
> >>>>      .start          = omap_rproc_start,
> >>>>      .stop           = omap_rproc_stop,
> >>>>      .kick           = omap_rproc_kick,
> >>>> +    .da_to_va       = omap_rproc_da_to_va,
> >>>>   };
> >>>>
> >>>>   static const char * const ipu_mem_names[] = {
> >>>> --
> >>>> 2.17.1
> >>>>
> >>>> --
> >>
> >> --
> >> Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
>

Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1675F349834
	for <lists+linux-omap@lfdr.de>; Thu, 25 Mar 2021 18:37:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230115AbhCYRgb (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 25 Mar 2021 13:36:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35790 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230041AbhCYRg0 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 25 Mar 2021 13:36:26 -0400
Received: from mail-io1-xd34.google.com (mail-io1-xd34.google.com [IPv6:2607:f8b0:4864:20::d34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 050DAC06174A
        for <linux-omap@vger.kernel.org>; Thu, 25 Mar 2021 10:36:26 -0700 (PDT)
Received: by mail-io1-xd34.google.com with SMTP id e8so2703496iok.5
        for <linux-omap@vger.kernel.org>; Thu, 25 Mar 2021 10:36:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=VdRMge6sdV5ktctESiFYyHXwrU2yYoKNxmrhqMmsgLI=;
        b=sxIVW0xGPaqdod1D5xroR1WaBxP6OVj9rIkErpr3i1SoDZENmnhlvZzq3jBCFNT+du
         HkDwWD3SXwKChk39ZH01ZvDu5VGSb1YaV1XXprk/p92QQrAK1ntI9v/Mf9Dd4xqsf2wT
         8IRuW4X9P+9zKsllBMJwznAg6rVzyMmm/mv7PdZISYVep20GNxBLJ+3H9Gk9PGgCIopm
         rn4ud13+0IAg8JwmMftLbo76hCNEBk7JwcXxnLhehQopFoJRJmy7I9vo0oJBCDQJ1jjM
         Yn7Q5S7C6IIP0sTWmXZz0qIuNdwK9V1hiHtTFfxCafZipgbC6/I+hh7LKw2gG32ZLgXc
         1AZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=VdRMge6sdV5ktctESiFYyHXwrU2yYoKNxmrhqMmsgLI=;
        b=OINyAiRlKBgGU6veeRfqPdAmfJVOQrO3ni+kmDEFtLC2PouuAS8tkDhXFskSmhva35
         n7BJk8lGFQwcBL0DUelchNcUOGeDP5UnrVM/GLyU8f/mNYPlRpqbB7/pMGLv0PExyEDf
         P4lDEE/CmR4bTQW4nXRcyzDmHTKxf6M6KIyKsVDkvo6nxRuMdQOAzMrWDd3sXBnc+KRg
         IYVuJwrobpGo/yUkosOXnjwdXx2DMUW3SdOim4ULU58VZsOwEee6oK8YymoNgmb6Ukuo
         j+8c4OX/YNjF6soxl8+/DJTKlkdX2PXsKFr/LbxkuixHzaqv9OyEs1q2t2DQ4JURkYEz
         tYig==
X-Gm-Message-State: AOAM531wpE+0O4sZpN9oOW4Lt9jBH3Re7DqKV6j8YM6T18A5GXxfMRKt
        l/Nwk8K92NDa4PWK0bXNEnOT+7LPliBi2QQWbeTHSg==
X-Google-Smtp-Source: ABdhPJwYh/LvLq5CzlRSuR5Ap+0Jdp6R+ZxP6fBfPH97VRXkhW6qBS/78XiXeEl1k1fe8eV+JXKIWx5cq7xtnMnU5Ms=
X-Received: by 2002:a05:6638:1390:: with SMTP id w16mr8544589jad.83.1616693785388;
 Thu, 25 Mar 2021 10:36:25 -0700 (PDT)
MIME-Version: 1.0
References: <20210315205859.19590-1-s-anna@ti.com> <20210323232014.GA1782475@xps15>
 <2f8bfc4f-e43d-5e38-fc6d-7045c69af364@ti.com>
In-Reply-To: <2f8bfc4f-e43d-5e38-fc6d-7045c69af364@ti.com>
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
Date:   Thu, 25 Mar 2021 11:36:14 -0600
Message-ID: <CANLsYkw75yTfzXBOV4u03XETYH4zfOPUozKRxp=RroYvzfXR9Q@mail.gmail.com>
Subject: Re: [PATCH] remoteproc: pru: Fix firmware loading crashes on K3 SoCs
To:     Suman Anna <s-anna@ti.com>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Grzegorz Jaszczyk <grzegorz.jaszczyk@linaro.org>,
        Jan Kiszka <jan.kiszka@siemens.com>,
        Lokesh Vutla <lokeshvutla@ti.com>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        linux-remoteproc <linux-remoteproc@vger.kernel.org>,
        linux-omap@vger.kernel.org,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Wed, 24 Mar 2021 at 11:09, Suman Anna <s-anna@ti.com> wrote:
>
> On 3/23/21 6:20 PM, Mathieu Poirier wrote:
> > On Mon, Mar 15, 2021 at 03:58:59PM -0500, Suman Anna wrote:
> >> The K3 PRUs are 32-bit processors and in general have some limitations
> >> in using the standard ARMv8 memcpy function for loading firmware segments,
> >> so the driver already uses a custom memcpy implementation. This added
> >> logic however is limited to only IRAMs at the moment, but the loading
> >> into Data RAMs is not completely ok either and does generate a kernel
> >> crash for unaligned accesses.
> >>
> >> Fix these crashes by removing the existing IRAM logic limitation and
> >> extending the custom memcpy usage to Data RAMs as well for all K3 SoCs.
> >>
> >> Fixes: 1d39f4d19921 ("remoteproc: pru: Add support for various PRU cores on K3 AM65x SoCs")
> >> Signed-off-by: Suman Anna <s-anna@ti.com>
> >
> > Probably a good idea to CC stable as well...
> >
> > Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>
>
> Thanks Mathieu. This patch is already staged on Bjorn's rproc-fixes branch
> though and part of linux-next since next-20210319. I have posted an additional
> 3-patch series for some more PRU fixes. Do you want me to post a v2 for those
> with stable Cc'd?

I didn't notice Bjorn had already picked it up.  Since the object is
now public there is no need to send a V2 for this one.  I haven't
looked at your other 3-patch series but if you think it is stable
material then yes, please send a new revision that CC stable.

Mathieu

>
> regards
> Suman
>
> >
> >> ---
> >>  drivers/remoteproc/pru_rproc.c | 2 +-
> >>  1 file changed, 1 insertion(+), 1 deletion(-)
> >>
> >> diff --git a/drivers/remoteproc/pru_rproc.c b/drivers/remoteproc/pru_rproc.c
> >> index 2667919d76b3..16979c1cd2f4 100644
> >> --- a/drivers/remoteproc/pru_rproc.c
> >> +++ b/drivers/remoteproc/pru_rproc.c
> >> @@ -585,7 +585,7 @@ pru_rproc_load_elf_segments(struct rproc *rproc, const struct firmware *fw)
> >>                      break;
> >>              }
> >>
> >> -            if (pru->data->is_k3 && is_iram) {
> >> +            if (pru->data->is_k3) {
> >>                      ret = pru_rproc_memcpy(ptr, elf_data + phdr->p_offset,
> >>                                             filesz);
> >>                      if (ret) {
> >> --
> >> 2.30.1
> >>
>

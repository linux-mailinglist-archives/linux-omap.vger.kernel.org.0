Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5130F4E21B5
	for <lists+linux-omap@lfdr.de>; Mon, 21 Mar 2022 09:06:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240711AbiCUIIH (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 21 Mar 2022 04:08:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41720 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345091AbiCUIHy (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 21 Mar 2022 04:07:54 -0400
Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 92291F2138;
        Mon, 21 Mar 2022 01:06:28 -0700 (PDT)
Received: from mail-wr1-f54.google.com ([209.85.221.54]) by
 mrelayeu.kundenserver.de (mreue108 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1N0X0U-1oJtik1HZU-00wVqJ; Mon, 21 Mar 2022 09:01:18 +0100
Received: by mail-wr1-f54.google.com with SMTP id q8so8128981wrc.0;
        Mon, 21 Mar 2022 01:01:18 -0700 (PDT)
X-Gm-Message-State: AOAM530QyJNXpQwGNlPMqeItywJxqMsl/zbjvWWzDpdlrZkXCr8RJaxz
        quxuO6/2myPpZKT/w0nv6SS5TdiP5FOIXzaaers=
X-Google-Smtp-Source: ABdhPJyn1rYxVcE3vSEk7fX9M0V9XhL9fPzronNopTs/qFftIqrfqDJrF+1Q25gMK0KMvVps+51S6HSesNjON/ttkuc=
X-Received: by 2002:a5d:6d0f:0:b0:203:9157:1c48 with SMTP id
 e15-20020a5d6d0f000000b0020391571c48mr17006225wrq.192.1647849677912; Mon, 21
 Mar 2022 01:01:17 -0700 (PDT)
MIME-Version: 1.0
References: <20220310233307.99220-1-jmkrzyszt@gmail.com> <YixWZ+IiN2l9jmzg@atomide.com>
In-Reply-To: <YixWZ+IiN2l9jmzg@atomide.com>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Mon, 21 Mar 2022 09:01:02 +0100
X-Gmail-Original-Message-ID: <CAK8P3a3nLV2FXRQVocELNTiLqJY-CZXy9Ko6CSunFnhou_493Q@mail.gmail.com>
Message-ID: <CAK8P3a3nLV2FXRQVocELNTiLqJY-CZXy9Ko6CSunFnhou_493Q@mail.gmail.com>
Subject: Re: [RFC RFT PATCH 0/4] ARM: OMAP1: clock: Convert to CCF
To:     Tony Lindgren <tony@atomide.com>
Cc:     Janusz Krzysztofik <jmkrzyszt@gmail.com>,
        Paul Walmsley <paul@pwsan.com>,
        Aaro Koskinen <aaro.koskinen@iki.fi>,
        Alan Stern <stern@rowland.harvard.edu>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Helge Deller <deller@gmx.de>,
        linux-omap <linux-omap@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        USB list <linux-usb@vger.kernel.org>,
        Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Arnd Bergmann <arnd@arndb.de>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:vgAUigR5OPNj49ogn46JzH0xL1qFerLhCnQe2Rw4G41COIuYwD2
 gDQhNMFMotYD1t0mm2MBqsdJWdav5iLbb5T0IpEp2gVK2WGlmTxXsfJ7ELVnTmM7NPGp78h
 ejDsVzbVo7ItJ26utXeSWw6cgLBwubNJdmpeMif5wlsKHWpInaHGs7TdHV5BGlq174FP8v/
 E1fG47z+WffR58W8Wpasw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:BPOaNPv7Tw0=:8k4QFT0FY7a7GBg9NpCVN4
 gCtHYVOrczoclRfMhTn+HeOmoTv95UKmbhp7rRDzXAECtbN5CRw71LFCl9merFGku/DXwKCWJ
 EL1kN8pfG25zBsgXFFvPHnrfV9jVMcr6ykgbZ6/IB9cPm0NVpqiaHFRsjo7izLrSNZX6tE951
 Xt80xYb75m0I3g/at+NiPs1FwPiRjSRpDf85zmKbdECUBKqUR65Z8e9ucf9wrH/oQjZDKt4uC
 ZjxDOz0cSWbN0C5DdxRrAIUjH4F4cUjn00SR54mt8Gp0m4hA9uaOrkSt2Rxse1va1MaLyxy8+
 /GqIk1KAvWSqhIyeKVdc9PON6xI+qRIoimZ4QAMIuOLn6DYz6ozKOi0K0BSDDGDzW9BzpZ+qL
 G7aEbOFwChDX2CxCXMJCNirvzR+/slUgAjpJnjmPf8VJ2dM+UpjbcxsLw3fT2SyKeqoqD0/ww
 mMlyvLGEzKtMEKIafqbL5f0MhTol50eAB7HcIhfOFqpefBp+vayLqUD2nwtDntXOBWA5cfcLx
 RCN4/M25Qua849SAcQv70bdHAtmESJ4FDfgVGKp9Hc9hW21JbsSTX7w6BMVgjLZ7LbM4L8rjk
 iTY9WH7M4HWMYHIFUnwSG0pEpAWsxMBvtZtf3PO7Am/l7snxlHDFN3Ckan9XbRiFdBba/N/lx
 Hczg0DwL89oiMjbqBl2v7LpmXGIubg5HsCj24O9nodhG0Df6rba9vfmD2/ZH5qycEv/cfyBWI
 HcZ0mPM6pYgzGsE4U67PU9yaB9o3xLjODH0/i5f1QJW+Wg0X+g69hTYF/XTG45nxTW9bCmos+
 jEueFjvZ8eyWVKzzDrPFHIpLFozxoP6Xx5t0pooa0cp9G+TGgc=
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Sat, Mar 12, 2022 at 9:14 AM Tony Lindgren <tony@atomide.com> wrote:
>
> * Janusz Krzysztofik <jmkrzyszt@gmail.com> [220310 23:32]:
> > The main motivation behind this series is planned resurection of OMAP1
> > camera driver.  Since OMAP1 clock internals have never been visible to
> > drivers, that driver used to use v4l2-clk to expose a pixel clock for a
> > sensor.  The v4l2-clk code has been recently depreciated and removed from
> > the media subtree, hence the need for an alternative solution.
>
> Nice :) This will also help Arnd with building multi-v5 kernels.

Thanks for looping me in, I missed the thread originally but now
got the replies.

As OMAP1 is the last user of HAVE_LEGACY_CLK on Arm, converting
it would be particularly nice, and it allows me to dig out my omap1
multiplatform patches, which does get us closer to endgame.

The only other ARM9 platforms that are not multiplatform yet are
ep93xx (which can probably be done now as well after its
clk conversion) and s3c24xx (which is scheduled for removal next
year).

When those are out of the way, we only have StrongARM (rpc,
sa1100, footbridge) and XScale (pxa, ixp, iop) remaining.

      Arnd

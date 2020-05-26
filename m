Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9815E1AA974
	for <lists+linux-omap@lfdr.de>; Wed, 15 Apr 2020 16:12:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2636445AbgDOOH2 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 15 Apr 2020 10:07:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35392 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S2636438AbgDOOHY (ORCPT
        <rfc822;linux-omap@vger.kernel.org>);
        Wed, 15 Apr 2020 10:07:24 -0400
Received: from mo6-p02-ob.smtp.rzone.de (mo6-p02-ob.smtp.rzone.de [IPv6:2a01:238:20a:202:5302::8])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 669BAC061A0C;
        Wed, 15 Apr 2020 07:07:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1586959641;
        s=strato-dkim-0002; d=goldelico.com;
        h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=3xRYp708JzBcF+nmyzTN9euUKBZizEPeF9myzhSW4qw=;
        b=lYFU0C1yl7Yg1aftzKRWDtB1X90kbTbFyIZirBTec/OjRV0fPx0/LRX+u6y+2cDqUz
        XfRnO76kdQLVXdpgmk3jzDSjdxRsSe104r98FglkwJhigx/CbCRyL0fb7MFF/gLRk83V
        ZDytu5jbBhMNlheSIgAcYUWYfI9XmhhfsdcwkfNOmoiHkIFK1sQPH1OMp86u8hPyAxja
        hnES5zYTtCdFan+76S3o7dVioek0aQqWYdPkpmZVfXXSKdadveF0q/F9/ob5+y6vdHWC
        IuX8vKgAlzlJueADQ9479Wb3Bufd8MATUjAqvNJIfG2e4EP7xvgWaBiwwyOokR5b4I0z
        2EBQ==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBp5hRw/qOxWRk4dCz3b9m9rH79DVQJPCq5egpDhipvc+uRd0DTkACO"
X-RZG-CLASS-ID: mo00
Received: from [IPv6:2001:16b8:26b3:fd00:65ed:197b:42b7:ade5]
        by smtp.strato.de (RZmta 46.4.0 AUTH)
        with ESMTPSA id 6028a2w3FE7B2MX
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
        (Client did not present a certificate);
        Wed, 15 Apr 2020 16:07:11 +0200 (CEST)
Subject: Re: [PATCH v6 07/12] ARM: DTS: omap5: add sgx gpu child node
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
Content-Type: text/plain; charset=us-ascii
From:   "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <20200415134754.GB21120@kozik-lap>
Date:   Wed, 15 Apr 2020 16:07:17 +0200
Cc:     David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        =?utf-8?Q?Beno=C3=AEt_Cousson?= <bcousson@baylibre.com>,
        Tony Lindgren <tony@atomide.com>,
        Paul Cercueil <paul@crapouillou.net>,
        Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paulburton@kernel.org>,
        James Hogan <jhogan@kernel.org>, Kukjin Kim <kgene@kernel.org>,
        Maxime Ripard <mripard@kernel.org>,
        Chen-Yu Tsai <wens@csie.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Philipp Rossak <embed3d@gmail.com>,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        linux-omap@vger.kernel.org, openpvrsgx-devgroup@letux.org,
        letux-kernel@openphoenux.org, kernel@pyra-handheld.com,
        linux-mips@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        "linux-samsung-soc@vger.kernel.org" 
        <linux-samsung-soc@vger.kernel.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <8CC38F9F-885E-4EB9-9D36-1FFC6A86A45F@goldelico.com>
References: <cover.1586939718.git.hns@goldelico.com> <004611c9660943759b635a87484932869927cf74.1586939718.git.hns@goldelico.com> <CAJKOXPdEkWniffmGZmf=S6E5UxWTdVGXnycqTFftXwo_45rz3w@mail.gmail.com> <EFA7F2F0-96EA-45D9-B8C8-00DC8C72344D@goldelico.com> <20200415134754.GB21120@kozik-lap>
To:     Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: Apple Mail (2.3124)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org


> Am 15.04.2020 um 15:47 schrieb Krzysztof Kozlowski <krzk@kernel.org>:
>=20
> On Wed, Apr 15, 2020 at 01:46:06PM +0200, H. Nikolaus Schaller wrote:
>> Hi Krzysztof,
>>=20
>>> Am 15.04.2020 um 13:38 schrieb Krzysztof Kozlowski =
<krzk@kernel.org>:
>>>=20
>>> On Wed, 15 Apr 2020 at 10:36, H. Nikolaus Schaller =
<hns@goldelico.com> wrote:
>>>>=20
>>>> and add interrupt.
>>>>=20
>>>> Tested-by: H. Nikolaus Schaller <hns@goldelico.com> # =
Pyra-Handheld.
>>>=20
>>> Don't add your own Tested-by tags. These are implied by authorship,
>>> otherwise all patches people make should have such tag.
>>=20
>> Ok I see. AFAIR it originates in several phases of editing to report =
on which device it was tested.
>>=20
>> Is there a canonical way of writing "tested-on: ${HARDWARE}"?
>>=20
>> E.g. would this be ok?
>>=20
>> Signed-off: H. Nikolaus Schaller <hns@goldelico.com> # tested on =
Pyra-Handheld
>=20
> If you think tested platform is worth mentioning in the commit msg
> (it will stay there forever, ever, ever) then just add a line like:
>=20
> "Add SGX GPU node. Tested on Pyra-Handheld."
>=20
> =46rom time to time we add such information to note that only one =
platform
> was actually tested.

Yes that is what it should express.

>  I am not sure what benefit it brings to most
> cases... but your commit msg is so short that adding one more sentence
> seems reasonable. :)

Ok, will queue for v7.

>=20
> Best regards,
> Krzysztof

BR and thanks,
Nikolaus


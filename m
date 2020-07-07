Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BF47C216AAE
	for <lists+linux-omap@lfdr.de>; Tue,  7 Jul 2020 12:48:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726911AbgGGKsb (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 7 Jul 2020 06:48:31 -0400
Received: from lelv0142.ext.ti.com ([198.47.23.249]:44450 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725941AbgGGKsb (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 7 Jul 2020 06:48:31 -0400
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 067AlXf7075713;
        Tue, 7 Jul 2020 05:47:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1594118854;
        bh=T+nHlhZOidYOCH29bUqU/Pu9XpetYy0kEACSndhggaU=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=W7I/bYA4P+vOJYQQssbhsAL3EojexiAa+4hA8Ips/b9sVXRZ/lf/JiINNDnpVcyce
         H9Ag4yjTH4rD48TwtCQnQEMC68gIMgROVFVlMQv/fuv2rMJPGwM3tBNQb9sa95Twlg
         sMzpFHxXjUXoh1/9xLoHvg3Ag5nFJR5SnOGcWFNI=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 067AlXG4099736
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 7 Jul 2020 05:47:33 -0500
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 7 Jul
 2020 05:47:33 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Tue, 7 Jul 2020 05:47:33 -0500
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 067AlVc2096354;
        Tue, 7 Jul 2020 05:47:31 -0500
Subject: Re: [PATCH 21/28] ASoC: ti: omap-mcbsp-st: Remove set, but unused
 variable 'w'
To:     Lee Jones <lee.jones@linaro.org>, <broonie@kernel.org>,
        <lgirdwood@gmail.com>, <perex@perex.cz>, <tiwai@suse.com>
CC:     <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <alsa-devel@alsa-project.org>,
        Jarkko Nikula <jarkko.nikula@bitmer.com>,
        Samuel Ortiz <samuel.ortiz@nokia.com>,
        <linux-omap@vger.kernel.org>
References: <20200707101642.1747944-1-lee.jones@linaro.org>
 <20200707101642.1747944-22-lee.jones@linaro.org>
From:   Peter Ujfalusi <peter.ujfalusi@ti.com>
X-Pep-Version: 2.0
Message-ID: <61d554e7-0579-3c6c-b9e1-30b135d5927c@ti.com>
Date:   Tue, 7 Jul 2020 13:48:34 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200707101642.1747944-22-lee.jones@linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi Lee,

On 07/07/2020 13.16, Lee Jones wrote:
> Looks like 'w' has remained unchecked since the driver's inception.
>=20
> Fixes the following W=3D1 kernel build warning(s):
>=20
>  sound/soc/ti/omap-mcbsp-st.c: In function =E2=80=98omap_mcbsp_st_chgai=
n=E2=80=99:
>  sound/soc/ti/omap-mcbsp-st.c:145:6: warning: variable =E2=80=98w=E2=80=
=99 set but not used [-Wunused-but-set-variable]
>=20
> Cc: Peter Ujfalusi <peter.ujfalusi@ti.com>
> Cc: Jarkko Nikula <jarkko.nikula@bitmer.com>
> Cc: Samuel Ortiz <samuel.ortiz@nokia.com>
> Cc: linux-omap@vger.kernel.org
> Signed-off-by: Lee Jones <lee.jones@linaro.org>
> ---
>  sound/soc/ti/omap-mcbsp-st.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>=20
> diff --git a/sound/soc/ti/omap-mcbsp-st.c b/sound/soc/ti/omap-mcbsp-st.=
c
> index 5a32b54bbf3bb..643ef7eb68fc8 100644
> --- a/sound/soc/ti/omap-mcbsp-st.c
> +++ b/sound/soc/ti/omap-mcbsp-st.c
> @@ -142,10 +142,9 @@ static void omap_mcbsp_st_fir_write(struct omap_mc=
bsp *mcbsp, s16 *fir)
> =20
>  static void omap_mcbsp_st_chgain(struct omap_mcbsp *mcbsp)
>  {
> -	u16 w;
>  	struct omap_mcbsp_st_data *st_data =3D mcbsp->st_data;
> =20
> -	w =3D MCBSP_ST_READ(mcbsp, SSELCR);
> +	MCBSP_ST_READ(mcbsp, SSELCR);

The read can be removed at the same time.

>  	MCBSP_ST_WRITE(mcbsp, SGAINCR, ST_CH0GAIN(st_data->ch0gain) |
>  		       ST_CH1GAIN(st_data->ch1gain));
>=20

- P=C3=A9ter

Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki


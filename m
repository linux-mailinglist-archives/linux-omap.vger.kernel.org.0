Return-Path: <linux-omap+bounces-1355-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9548F8BE610
	for <lists+linux-omap@lfdr.de>; Tue,  7 May 2024 16:35:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C5E1C1C21ED1
	for <lists+linux-omap@lfdr.de>; Tue,  7 May 2024 14:35:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 75D5815FA6D;
	Tue,  7 May 2024 14:35:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jsh4qTC5"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03170154BFC;
	Tue,  7 May 2024 14:35:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715092503; cv=none; b=A1pZZX+PduMimOklglXLEpz1FRfHXePpEdRBgXUOMQ4utjG7hJn7hi6Qcm37sVwEiaWa1HXuypugSunKLN3ne0c1e7R/QcS1ZTb7URx+41d1/P47hyulrxjJwPDCrGWUMZtNHm5Xc8PP/yQaELaqxToK+iGcauZgv5GMA7A4kIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715092503; c=relaxed/simple;
	bh=y6WKrVLOQiWpSilDvghHWU2H2C7Bg6g2vDY3+N3fXQ4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=JS5F2yhufBoNmq+GPCtWYF4iJDnYlF42vwV+f1NNRW9NAhdc6VpUj+IMPfsFKf4RDn908vNjfdIOJGoEU4QdaZgALZTHCSXzu8ScyoEE/Jxn8Cj/ydQSriWtytd0FURBPb4beu4QLfiHw5MjXnq9hf73CFYjFq3SWyWT0A/ZBs4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jsh4qTC5; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16855C2BBFC;
	Tue,  7 May 2024 14:34:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715092502;
	bh=y6WKrVLOQiWpSilDvghHWU2H2C7Bg6g2vDY3+N3fXQ4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=jsh4qTC5gVZ7sYBPuy5NlWFptghPLLD48L0GvjH4JiS3kx7qOWhxE7m21fp7sfw5c
	 OZfXdkbVtD4CmIf0rWQc/ADEFT+DencCfMXoMCOMYluT7CnDXVqh+Po/Z45ToGLJ4N
	 q/GfiRzpjYDI+kuA54dDD4j/cOQ6T81YZvpCLOiTrXY8Rsqbr2u3Pt4dWloOqnbdmK
	 dEF17UfmRG74qkmmf4YzoCKy1/QtSvaWf3ESfV5psZBtE0MmNvwqoDLyERgaX9ZgtU
	 ZOs30E1pnraWOyvvVNTqrFU7qisbhaGsGF5Z+19N7FUZM8OUy3ExYFzba4k3X0v+0X
	 dOQVG31vmlkFA==
From: Mark Brown <broonie@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
 Banajit Goswami <bgoswami@quicinc.com>, Liam Girdwood <lgirdwood@gmail.com>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>, 
 Peter Ujfalusi <peter.ujfalusi@gmail.com>, 
 Jarkko Nikula <jarkko.nikula@bitmer.com>, Daniel Mack <daniel@zonque.org>, 
 Haojian Zhuang <haojian.zhuang@gmail.com>, 
 Robert Jarzmik <robert.jarzmik@free.fr>, 
 Shengjiu Wang <shengjiu.wang@gmail.com>, Xiubo Li <Xiubo.Lee@gmail.com>, 
 Fabio Estevam <festevam@gmail.com>, Nicolin Chen <nicoleotsuka@gmail.com>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Ban Tao <fengzheng923@gmail.com>, Chen-Yu Tsai <wens@csie.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: alsa-devel@alsa-project.org, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org, 
 linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linuxppc-dev@lists.ozlabs.org, imx@lists.linux.dev, 
 linux-mediatek@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-sunxi@lists.linux.dev
In-Reply-To: <20240430-asoc-snd-substream-clean-v1-0-6f8a8902b479@linaro.org>
References: <20240430-asoc-snd-substream-clean-v1-0-6f8a8902b479@linaro.org>
Subject: Re: [PATCH 00/13] ASoC: Use snd_soc_substream_to_rtd() for
 accessing private_data
Message-Id: <171509249287.1985791.3932273255744591305.b4-ty@kernel.org>
Date: Tue, 07 May 2024 23:34:52 +0900
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14-dev

On Tue, 30 Apr 2024 16:02:09 +0200, Krzysztof Kozlowski wrote:
> Do not open-code snd_soc_substream_to_rtd() when accessing
> snd_pcm_substream->private_data.  This makes code more consistent with
> rest of ASoC and allows in the future to move the field to any other
> place or add additional checks in snd_soc_substream_to_rtd().
> 
> Best regards,
> Krzysztof
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[01/13] ASoC: qcom: Use snd_soc_substream_to_rtd() for accessing private_data
        commit: 77678a25d1ecf70dc1d7ea2c0ab7609af15b83d3
[02/13] ASoC: tegra: Use snd_soc_substream_to_rtd() for accessing private_data
        commit: 3beb985abbf29e660edd1708f8a120ae9bbbddc3
[03/13] ASoC: ti: Use snd_soc_substream_to_rtd() for accessing private_data
        commit: 72a666f47f958a57db16b6bdd9ed385674069693
[04/13] ASoC: arm: Use snd_soc_substream_to_rtd() for accessing private_data
        commit: a80f2f8443a4ae10c568566f57fe704ea52c5bdb
[05/13] ASoC: amd: Use snd_soc_substream_to_rtd() for accessing private_data
        commit: a84d84077512fc64cf1fc2292a3638690a026737
[06/13] ASoC: fsl: Use snd_soc_substream_to_rtd() for accessing private_data
        commit: b695d8be5bba9897ee670ec102ca608ecaf625c4
[07/13] ASoC: img: Use snd_soc_substream_to_rtd() for accessing private_data
        commit: 3b62178720594e08bdf8a87515ccca0328fe41fe
[08/13] ASoC: kirkwood: Use snd_soc_substream_to_rtd() for accessing private_data
        commit: fe42c3b75b93dee9a4010e2297f1783e48684af7
[09/13] ASoC: loongson: Use snd_soc_substream_to_rtd() for accessing private_data
        commit: ffad75cebb865fef6f8e40f921c08c79a8faf7e3
[10/13] ASoC: mediatek: Use snd_soc_substream_to_rtd() for accessing private_data
        commit: 410a45140fb76709cf2bbad84bc8a731acf632c8
[11/13] ASoC: meson: Use snd_soc_substream_to_rtd() for accessing private_data
        commit: 22f5680a9cbc7388f97e5386c15c325d6961b958
[12/13] ASoC: samsung: Use snd_soc_substream_to_rtd() for accessing private_data
        commit: 3e726593107d134221f666b4f2be612b278c3ddb
[13/13] ASoC: sunxi: Use snd_soc_substream_to_rtd() for accessing private_data
        commit: 47aa51677c975a5f66bc93d1c527e8878cf34d6c

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark


